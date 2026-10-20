# DECISIONS.md — architecture decision records

## ADR-001 — NTT packée 4×64 avec réduction de Montgomery, remplaçant direct

**Contexte**
Les deux vérifieurs (NIST et ETH) passaient 9 transformées scalaires par
vérification, une coefficient par mot, un `mulmod` et deux `mstore` par
papillon : 195 k / 211 k par transformée, 1,8 M sur 8,1 M (NIST) et 4,8 M
(ETH). Le layout à quatre lanes de 64 bits par mot divise par quatre le trafic
mémoire et les multiplications des couches alignées, mais impose une réduction
locale à la lane, sans `mulmod`. Pour q = 8 380 417 (23 bits), un Barrett à une
étape ne reste pas local (M < 2¹⁴ pour x < 2⁵⁰), d'où le Barrett à deux
étapes de fireblocks (dix ops, quatre multiplications).

**Décision**
1. Réduction de Montgomery R = 2³² dans les couches packées, twiddles de ces
   couches stockés en forme de Montgomery (w·2³² mod q) : six ops, trois
   multiplications, aucune conversion. Le `shr(32)` final sur le mot entier est
   correct parce que x + t·q est divisible par 2³² dans chaque lane. Mesuré
   sur la même passe radix-8 dans un contrat déployé : 14 868 contre 16 788
   pour le Barrett à deux étapes, soit 20 gas par papillon-mot, ≈ 3,8 k par
   transformée, ≈ 35 k par vérification. Le résidu < 1,06q garde la même
   discipline de croissance (biais 2q).
2. Couches t = 2, 1 en scalaires `mulmod` : les lanes sont extraites de toute
   façon pour lire l'entrée étendue et écrire la sortie étendue canonique, et
   `mulmod` à 8 gas bat une réduction SWAR à deux lanes (mesuré : la variante
   SWAR lazy coûte 6 à 13 % de plus dans les deux directions).
3. Remplaçant direct, pas de contrat séparé : `nttFwMont` / `nttInvMont` ont la
   signature, la sémantique en place et le résultat de `nttFw` / `nttInv`. Les
   trois fichiers appelants changent une ligne d'import. Le scalaire reste dans
   l'arbre comme référence des tests différentiels.
4. Fichier Solidity GÉNÉRÉ (`pythonref/ntt_mont/gen_ntt_mont.py`, puis
   `forge fmt`), schedule validé d'abord par `model_ntt_mont.py` avec
   assertions de bornes. Toute modification passe par le modèle, puis le
   générateur ; le fichier `.sol` ne s'édite pas à la main.

**Conséquences**
- 8 094 831 → 6 987 680 (NIST) et 4 827 994 → 3 683 689 (ETH). La NTT pèse
  désormais 9 × ~73 k ≈ 650 k ; le reste du vérifieur (matvec, décodage,
  hints, expansion, SHAKE) est le prochain chantier.
- Préconditions : entrées canoniques (< q). Le vérifieur les garantit (z décodé,
  c ∈ {0, 1, q−1}, sortie `addmod` de `vecSubMulMod`). L'aller tolère < 2³²,
  l'inverse non (branche `l0 + q − l1` scalaire).
- Le modèle Python est la spécification des bornes ; les cas saturés des tests
  Solidity les exercent, les fuzz les couvrent au hasard.
- À armes égales avec fireblocks (via-IR, packé → packé, sortie aller lazy),
  nos noyaux sont moins chers : 40 059 contre 44 931 (aller), 45 425 contre
  53 591 (inverse). La version livrée paie ~6 k par transformée d'entrée /
  sortie étendue et ~2 k de canonicalisation, prix du remplacement direct.

**Attribution**
Le layout packé à quatre lanes de 64 bits et les passes radix-8 fusionnées
suivent fireblocks-labs/evm-ml-dsa-verifier (MIT, cca262b), qui a lui-même
crédité ZKNOX pour l'expansion de clé hors chaîne et vendorisé nos noyaux
scalaires comme baseline. Réduction (Montgomery au lieu du Barrett à deux
étapes), schedule, tables, modèle, générateur et code sont à nous ; aucune
ligne de leur dépôt n'est reprise. La mention suit leur propre pratique et
coûte une phrase.

**Ce qui a été mesuré et refusé**
SWAR lazy intra-mot (plus cher des deux côtés), via-IR pour le dépôt (−20 k par transformée, +0 sur
le vérifieur, coût de compilation ×3), passes mesurées en ligne dans le
contrat de test (jusqu'à +30 % sous 0.8.30 legacy, artefact de compilation du
contrat de test, voir VERSION.md).

## ADR-002 — Second étage (A·z − c·t1, inverse, hints, w1) sur le layout packé, clé consommée telle que stockée

**Contexte**
Après la NTT Montgomery, le second étage restait scalaire : `expandMat`
(826 k) et `expandVec` (193 k) déployaient la clé en un coefficient par mot
(128 Ko de mémoire), `matVecProductDilithium` (679 k) et `vecSubMulMod`
(240 k) faisaient un `mulmod` et un `mstore` par coefficient,
`useHintDilithium` (309 k) branchait par coefficient. Les transformées
packées payaient en plus une entrée/sortie étendue (~6 k chacune).

**Décision**
1. La clé n'est plus déployée : A_ij et t1_i sont lus dans leur forme de
   stockage (32 mots de huit champs de 32 bits), un mot compact par paire de
   mots packés, champ extrait par `shr`/`and`. Le format du blob SSTORE2 ne
   change pas.
2. Accumulateur packé non réduit : quatre produits de lane (< 2⁵¹) plus un
   biais q·2²⁸ moins le produit c·t1, < 7,03e15 < q·2³⁰. La réduction est
   repliée dans la première passe de l'inverse, qui est scalaire de toute
   façon : `addmod` sur les sommes, offset q·2³⁰ sur les différences. Aucune
   passe de réduction, aucun `mod`.
3. Sortie de la NTT aller lazy et packée (< 17q) : c'est la borne que le
   produit de lane admet, la canonicalisation était un coût sans
   consommateur.
4. Hints et w1 en SWAR, formulation vérifiée exhaustivement hors chaîne
   (numpy, tout r et les deux hints) puis différentiellement en Solidity ;
   masques de hints tirés des 84 octets de l'encodage, pas des tableaux
   décodés.
5. `dilithiumCore2Packed` remplace l'appel dans les deux vérifieurs ; le
   scalaire reste comme référence des tests. Contrat : même w1, asserté sur
   une vraie signature.

**Conséquences**
- 6 987 680 → 4 920 733 (NIST), 3 683 689 → 2 075 464 (ETH) ; 1,64x et 2,33x
  depuis l'origine.
- Préconditions : z canonique (unpackZ), c ∈ {0, 1, q−1} (SampleInBall),
  encodage de h validé par `unpackH` avant l'appel (le vérifieur s'arrête
  sur échec ; `_hintMasksFromBytes` ne revalide pas). Les champs de la clé
  sont supposés canoniques (ils le sont par construction du blob) : un champ
  ≥ q resterait sous la borne de lane tant qu'il tient sur 32 bits, mais le
  résultat serait celui du scalaire modulo q seulement si le champ est < q.
- Le premier poste scalaire est maintenant `unpackZ` (dans les 826 k de
  core1), puis SHAKE sur le NIST.

**Attribution**
Comme ADR-001 : layout et structure d'après fireblocks-labs/evm-ml-dsa-verifier
(matvec en deux passes, réduction repliée dans la première passe de
l'inverse, hints par masques), noyaux et formulations à nous.

## ADR-003 — SHAKE256 sur helper externe lié par code hash, décodage et clé sans copie

**Contexte**
Après le second étage packé, le NIST coûtait 4,92 M dont 3,08 M de SHAKE en
Solidity (SampleInBall 790 k, μ 407 k, hash final 1 880 k), 826 k de core1
(unpackZ dominant) et 82 k de lecture de clé. Ces trois postes étaient
scalaires ou en Solidity checké.

**Décision**
1. La permutation Keccak-f[1600] est déléguée au helper de
   fireblocks-labs/evm-ml-dsa-verifier (bytecode brut de 21 622 octets, MIT,
   41,7 k par permutation), comme dans ZKNoxHQ/ETHFALCON (ADR-001 et 002 de
   ce dépôt-là) : liaison par EXTCODEHASH à la construction et à chaque
   verify, jamais par adresse. La glue d'éponge est reprise verbatim avec
   son en-tête MIT ; SampleInBall est réécrit sur cette éponge par nous. Le
   nombre de permutations est fixé par FIPS 204 (1 + 1 + 7), le helper est
   le plancher de ce poste. Prix : un constructeur à un argument et un
   déploiement du helper par chaîne (4,32 M). La version ETH, sur Keccak
   natif, n'est pas concernée.
2. z est décodé directement en packé avec sa borne, hints validés sans
   tableaux, clé pointée dans le blob SSTORE2 (format inchangé, forme
   vérifiée en lisant). Plus aucune structure « un coefficient par mot »
   dans le chemin de vérification.
3. Borne de norme conforme à FIPS 204 (rejet si ‖z‖∞ ≥ γ₁ − β) ; l'ancien
   vérifieur acceptait l'égalité. Documenté, KATs inchangés.
4. Masque de lane chargé en variable Yul par passe : ce qui a ramené le
   vérifieur NIST sous EIP-170 (27 411 → 23 392 octets) et les noyaux à
   59 k / 62 k. Le dépassement d'EIP-170 était silencieux en test (forge
   n'impose pas la limite) : la taille est désormais vérifiée à chaque
   livraison (`forge build --sizes`).

**Conséquences**
- 1 358 953 (NIST) et 1 001 185 (ETH) après les hashs groupés et le décodage
  resserré (VERSION.md, entrée 4), 5,96x et 4,82x depuis l'origine ;
  1 341 093 / 894 848 sous via-IR.
- Provenance du helper : bytecode vendorisé, non reproductible depuis une
  source publiée (voir ETHFALCON, ADR-001). Un générateur ZKNOX de
  permutation déroulée est le moyen de retirer cette dépendance ; même gas.
- Un blob de clé d'une autre forme revert (« bad pk blob ») là où
  `abi.decode` revertait aussi ; les clés déjà déployées sont lues telles
  quelles.

**Attribution**
Helper et glue d'éponge : Fireblocks (MIT, en-tête de
`ZKNOX_shake_fast.sol`). Décodage de z en SWAR, validation des hints,
lecture de clé, SampleInBall packé : à nous.

## ADR-004 — Profil de compilation : via-IR et `optimizer_runs = 1000000`, un choix de conception

**Contexte**
Les noyaux SWAR utilisent des constantes de 32 octets (masques de lanes,
biais q répliqués) des dizaines de fois par passe. L'optimiseur de constantes
de solc choisit pour chaque constante entre PUSH32, une forme calculée et
CODECOPY depuis la section de données, avec un modèle de coût qui pèse le
déploiement (octets × 200) contre l'exécution (gas × `optimizer_runs`). À
`runs = 10000` et 102 occurrences, CODECOPY gagne : chaque usage du masque
coûte ~25 gas au lieu de 3, sans que rien ne le signale. L'effet dépend du
nombre d'occurrences dans le contrat, donc du contexte : la même passe
coûtait 40 k dans un petit contrat et 49 k dans le vérifieur. Sous le codegen
legacy, la variable Yul `m32` (un DUP par usage) contournait le problème ;
sous via-IR, l'optimiseur rematérialise la variable en littéral et le
problème revient.

**Décision**
1. `optimizer_runs = 1000000` : le terme d'exécution domine, PUSH32 partout.
2. `via_ir = true` par défaut : −20 % sur les noyaux packés (ordonnancement
   de pile), −11 k / −108 k sur les vérifieurs une fois 1 réglé. Le profil
   `lite` (tests) l'utilisait déjà.
3. Erreurs personnalisées dans les noyaux pour tenir sous EIP-170 en via-IR
   (marge 687 octets sur le NIST). `forge build --sizes` fait partie de la
   checklist de livraison.

**Conséquences**
- 1 244 890 (NIST) et 892 644 (ETH) au moment de la décision ; 1 196 707 et
  847 709 après les réglages qui ont suivi (VERSION.md, entrée du
  2026-09-05 (2)), sous le chiffre de fireblocks sur le NIST.
- Le bytecode déployé change ; c'est un choix de design au même titre que le
  layout mémoire, comme chez fireblocks.
- Règle pour la suite : tout noyau qui répète une constante de 32 octets se
  mesure dans le contrat final, pas isolément ; un `grep codecopy` dans
  `forge inspect <contrat> asm` détecte la matérialisation.
- Règle d'écriture (ETHFALCON, ADR-005) : une boucle avance ses pointeurs
  de la taille de son pas et ne recalcule pas une adresse depuis un
  compteur ; les tables constantes se copient une fois par vérification,
  pas une fois par transformée.

**Mesuré et refusé**
Lecture de clé en flux (+600), matvec sur lanes séparées (+26 k), passes
non `memory-safe` (identique), passes fusionnées en un bloc (identique,
gardées). Ce qui reste au-dessus de fireblocks (~20 k) est dispersé sur
matvec, hints, décodage et SampleInBall, chacun à ~10 % de leur noyau.

## ADR-005 — Clé ML-DSA-65 en quatre blobs de neuf polynômes, dépôt transaction par transaction

**Contexte**

La clé étendue ML-DSA-65 ne tient dans aucun contrat EIP-170. Le premier
découpage (ADR du 2026-09-16, cf. VERSION.md) prenait deux moitiés de
20 160 octets, alignées sur les lignes de Â (0..2 et 3..5), chacune encodée
comme `abi.encode(bytes aHatRows, bytes tr, bytes t1Polys)`.

Deux règles rendent ce découpage inutilisable à court terme :

- EIP-7825, actif depuis Fusaka, plafonne une transaction à 2²⁴ = 16 777 216
  gas ;
- EIP-8037, dans Glamsterdam, porte le dépôt de code de 200 à 1 530 gas par
  octet.

Une moitié de 20 160 octets coûterait alors 20 160 × (1 530 + 16) + base
≈ 31,2 M : au-dessus du plafond par transaction, et la clé entière ≈ 60 M,
au-dessus d'un bloc. La clé deviendrait indéployable sur Sepolia dès le fork,
puis sur mainnet.

**Décision**

Quatre blobs de neuf polynômes, 9 504 octets chacun et 9 600 pour le dernier,
qui porte aussi `tr`. Le découpage est par compte, pas par ligne : le blob b
contient les indices plats 9b..9b+8, où f < 30 vaut A[f / 5][f % 5] et f ≥ 30
vaut t1[f − 30]. Le `pk` est les quatre adresses (80 octets).

Neuf est le plus grand compte qui laisse de la marge sous le plafond : le plus
gros blob revient à 14 911 998 gas après EIP-8037, soit 89 % du plafond. Dix
polynômes par blob tiendraient encore en trois blobs plus un, mais à 98 % du
plafond, sans marge pour un changement de tarif ou un surcoût d'appel.

Les blobs perdent leur encadrement ABI : un blob est la suite brute de ses
polynômes, chacun précédé de son mot de longueur 32, puisqu'ils sont utilisés
sur place comme `uint256[32]`. Le lecteur parcourt le blob par arithmétique au
lieu de suivre des offsets, et la seule forme acceptée est une taille de code
exacte avec un mot de longueur 32 devant chaque polynôme et 64 devant `tr`.

Côté API, `setKey(clé entière)` est conservée pour les chaînes qui tarifent
encore le dépôt à 200, et deux fonctions sont ajoutées pour le dépôt réparti :
`storeBlob(blob)` par transaction, puis `packKey(adresses)` pour le `pk`.

**Alternatives écartées**

- *Garder les deux moitiés et attendre.* La clé cesserait d'être déployable au
  fork, sans chemin de migration pour les clés déjà en place.
- *Six blobs d'une ligne de Â plus un pour t1.* Sept pointeurs, 140 octets de
  `pk`, trois `extcodecopy` de plus et trois accès de compte froids, pour une
  marge dont on n'a pas besoin.
- *Rempaqueter les coefficients sur 23 bits* (−28 % d'octets). Dépaquetage de
  30 polynômes à chaque vérification : à chiffrer séparément, et orthogonal au
  plafond par transaction, qui porte sur le dépôt.

**Conséquences**

- `verify` passe de 1 536 544 à 1 535 454 : le lecteur plat rend plus que ne
  coûtent les deux `extcodecopy` et les deux accès froids supplémentaires.
- Taille du vérifieur 24 385 (marge EIP-170 191, contre 304 avant) : le coût
  de `storeBlob` et `packKey`. Toute addition ultérieure se mesure.
- Dépôt d'un blob : 2 143 998 gas aujourd'hui, 14 911 998 après EIP-8037,
  mesuré dans `test/dilithium65_deploy.t.sol`, qui échoue si une évolution
  repasse au-dessus du plafond.
- Le format des blobs est produit par `js/mldsa65.js` `encodePublicKeyBlob65`
  et vérifié contre un décodage indépendant dans
  `test/dilithium65_core_packed.t.sol`.
- Un blob de la bonne taille placé au mauvais rang est accepté s'il n'est pas
  le dernier, puisque seul le dernier porte `tr` : le `pk` est une permutation
  signifiante, pas un ensemble. Un rang faux donne une autre clé, qui ne
  vérifie pas.

## ADR-006 — Clé en calldata : contrat séparé plutôt qu'un second chemin dans ZKNOX_dilithium65

**Contexte**

Après ADR-005, installer une clé ML-DSA-65 coûte 8,5 M de gas aujourd'hui et
59,2 M une fois EIP-8037 en place. Pour un compte qui signe quelques fois par
an, ce dépôt écrase tout le reste : il faut une centaine de vérifications pour
l'amortir. La variante retenue sur ML-DSA-44 le 2026-10-16 passe la clé dans le
calldata et ne garde rien on-chain.

Deux formes étaient possibles pour le 65 : ajouter les entrées calldata à
`ZKNOX_dilithium65`, ou un contrat séparé.

**Décision**

Un contrat séparé, `ZKNOX_dilithium65_calldata`, qui partage les noyaux et la
forme de clé mais ne connaît ni SSTORE2 ni stockage.

`ZKNOX_dilithium65` est à 191 octets de la limite EIP-170. Une seconde entrée
de clé, son lecteur et les contrôles associés n'y tiennent pas, et on ne veut
pas financer cette place en retirant le chemin pointeurs, qui reste le moins
cher au-delà du seuil. Séparés, les deux contrats font 24 385 et 23 712, avec
191 et 864 octets de marge.

Le vérifieur calldata ne tient aucun état. `setKey` contrôle la longueur et
rend son argument : l'appelant garde ces octets comme `pk` et les engage par
keccak256, exactement comme il engage aujourd'hui un handle de pointeurs. Le
lien entre une clé et un compte reste donc dans le compte, et `ZKNOX_PQAccount7702`
fonctionne sans modification, son `postQKeyHash` portant simplement sur
38 112 octets au lieu de 20.

Aucun registre on-chain `keys[msg.sender]` n'est ajouté : il ne servirait
qu'aux appelants qui n'ont pas déjà un engagement, et il introduirait un SLOAD
froid plus un état par compte pour une garantie que l'appelant possède déjà.

**Alternatives écartées**

- *Entrées calldata dans `ZKNOX_dilithium65`.* Ne tient pas sous EIP-170 sans
  retirer le chemin pointeurs.
- *Registre `keys[msg.sender] = keccak256(clé)` et `verifyRegistered`.* +9 276
  par vérification (keccak sur 38 112 octets plus un SLOAD froid) pour
  reproduire un contrôle que l'appelant fait déjà.
- *Rempaqueter les coefficients sur 23 bits avant de les envoyer* (−28 % de
  calldata, soit environ −150 k). Dépaquetage de 36 polynômes à chaque
  vérification : à chiffrer, et orthogonal à cette décision puisque le gain
  vaut aussi pour les blobs.

**Conséquences**

- Mêmes octets de clé des deux côtés : la concaténation des quatre blobs est
  déjà la suite plate que lit `readPubKeyCalldata65`. Une clé passe d'un
  vérifieur à l'autre sans réencodage, et `js/mldsa65.js` ne change pas.
- Les deux vérifieurs s'exécutent pour presque le même gas, 1 546 030 contre
  1 543 311 : atteindre quatre contrats froids et copier leur code vaut à peu
  près la copie des mêmes octets depuis le calldata. Toute la différence est le
  calldata, 538 132 contre 55 744.
- Seuil de bascule : 17 vérifications par clé aujourd'hui, 122 après EIP-8037.
  `test/dilithium65_calldata.t.sol` recalcule ces seuils à chaque exécution.
- Deux contrats à déployer et à vérifier sur chaque chaîne, et un choix à
  documenter pour les intégrateurs.
- Règle de mesure : un chronométrage forge autour d'un appel externe compte
  aussi l'appelant qui construit l'argument, soit environ 16 k pour une clé de
  38 Ko, que la transaction paie en calldata et non en exécution. Les deux
  chemins se mesurent contre un appelé qui ne fait rien, et la différence est
  le coût du vérifieur.


## ADR-007 — ML-DSA-65 : clé en calldata seule, chemin SSTORE2 retiré

**Contexte**

ADR-005 a coupé la clé étendue en quatre blobs pour qu'un dépôt tienne sous le
plafond par transaction d'EIP-7825 après EIP-8037. ADR-006 a ajouté, à côté, un
vérifieur qui prend la clé dans le calldata et ne garde rien on-chain.

Les deux chemins coûtent presque la même chose à exécuter. La différence est
ailleurs :

| | pointeurs | calldata |
|---|---:|---:|
| par vérification | ~1 620 000 | 2 107 680 |
| installation d'une clé, aujourd'hui | 8 513 784 | 0 |
| installation d'une clé, après EIP-8037 | 59 202 744 | 0 |

Le seuil de bascule est de 17 vérifications par clé aujourd'hui et de 122 après
EIP-8037. Au-delà, les pointeurs gagnent.

**Décision**

Retirer le chemin SSTORE2. `ZKNOX_dilithium65` est désormais le vérifieur à clé
en calldata, et c'est le seul.

Les cas visés sont le vault d'un particulier, son satellite et un signataire de
Safe. Aucun ne signe plus de 122 fois avec la même clé, et surtout aucun
détenteur n'acceptera de payer 59,2 M de gas d'avance, répartis en quatre
transactions, pour installer une clé. Le chemin pointeurs n'aurait servi qu'à un
vérifieur partagé très sollicité, un pont ou un oracle, qui n'est pas au
programme.

Ce qui disparaît : `storeBlob`, `packKey`, `readPubKeyPacked65`, les constantes
de blob, les quatre contrats SSTORE2, `test/dilithium65_deploy.t.sol` et le
second script de déploiement.

Ce qui reste d'ADR-005 : **le format plat**. La clé est une suite de 36
polynômes `[32][32 mots]` suivie de `tr`, soit 38 112 octets, parcourue par
arithmétique. C'est lui qui a permis à ADR-006 de lire la même clé depuis le
calldata sans réencodage, et il reste le format du vérifieur.

**Alternatives écartées**

- *Garder les deux et laisser l'intégrateur choisir.* Deux contrats à déployer,
  à vérifier et à auditer par chaîne, pour un chemin dont aucun cas connu n'a
  besoin.
- *Un registre `keys[msg.sender] = keccak256(clé)` et `verifyRegistered`.*
  +9 276 par vérification, keccak sur 38 112 octets plus un SLOAD froid, pour
  reproduire un contrôle que l'appelant fait déjà : `ZKNOX_PQAccount7702`
  compare `keccak256(postQKey)` à son `postQKeyHash` à chaque signature.

**Conséquences**

- Un seul contrat à déployer par chaîne, 23 712 octets, marge EIP-170 de 864
  contre 191 pour la variante à pointeurs. La place récupérée absorbera une
  évolution future du noyau.
- Plus rien à installer par clé, donc EIP-8037 cesse de concerner le 65.
- Une vérification coûte 2 107 680 gas, dont 538 132 de calldata pour 41 760
  octets. Le plancher EIP-7623 est à 1 366 170, sans effet.
- `setKey` contrôle la longueur et rend son argument. L'appelant garde ces
  octets comme `pk` et les engage par keccak256, ce que le compte fait déjà.
- Le `signature` d'un UserOperation ERC-4337 atteint environ 41 824 octets, ce
  qui heurtera les politiques de bundler bien avant la limite de 128 Ko du
  mempool. Les chemins relayés, `executeWithHybridSig` et `execTransaction` du
  Safe, ne sont pas concernés.
- Revenir en arrière est possible : ADR-005 et ADR-006 restent dans l'historique
  git, et le format de clé est inchangé.
