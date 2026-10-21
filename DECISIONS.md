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

## ADR-008 — Matvec à deux produits par multiplication sur des lanes scindées, clé 65 lue dans le calldata

**Contexte**

Après ADR-007 le profil du 65 (1 549 610 d'exécution) était : neuf
permutations Keccak 385 k (plancher fixé par FIPS 204 et le helper), douze
NTT 510 k, matvec 429 k, UseHint 110 k, unpackZ 91 k, SampleInBall 69 k,
copie de la clé 22 k. Le matvec était le premier poste hors permutations :
48 produits par mot de clé, chacun payant l'isolement d'une lane de z
(`and` sur un masque de 32 octets) et l'extraction d'un champ de clé
(`shr` puis `and`), soit environ 46 gas par produit mesurés.

**Décision**

1. *Deux produits par `mul`.* La clé reste dans son format (huit champs de 32
   bits par mot, coefficient 8m+f en champ f). Les z transformés et c sont
   écrits par la NTT directe en lanes scindées : pour quatre coefficients, un
   mot pair (c0 en 0, c2 en 64) et un mot impair (c1 en 32, c3 en 96). Contre
   le mot de clé masqué à ses champs pairs (f0 en 0, f2 en 64) ou impairs (f1
   en 32, f3 en 96), une multiplication place c0·f0 en 0 et c2·f2 en 128
   (pair) ou c1·f1 en 64 et c3·f3 en 192 (impair), et les produits croisés
   sur les lanes 1 ou 2. Deux accumulateurs, lanes 0-2 pour l'un, 1-3 pour
   l'autre, fusionnés par masques ; les lanes croisées reçoivent 2^60 à la
   place de q·2^28 pour que la soustraction de c·t1 n'y emprunte jamais
   (douze produits croisés < 2^54), et sont masquées. Les lanes voulues
   gardent exactement la borne de l'ancien noyau (< q·2^30, celle de la
   première passe inverse). 24 `mul` au lieu de 48, un `and` par produit au
   lieu de quatre opérations : 1 094 gas par mot de clé contre 2 230.
2. *La scission est écrite par la dernière passe de la NTT directe*
   (`nttFwMontPackedFusedTbSplit`), qui reconstruit de toute façon le mot
   packé à partir de ses quatre lanes scalaires : écrire les deux mots
   scindés coûte un `mstore` de plus et une passe de scission de moins
   (66 k pour les six polynômes du 65).
3. *La clé du 65 reste dans le calldata.* `calldataload` coûte ce que coûte
   `mload` ; la copie des 38 112 octets et l'expansion quadratique de toute
   la mémoire qui la suivait coûtaient 29 k. `checkPubKeyCalldata65` applique
   la règle de forme de `readPubKeyCalldata65`, puis `dilithiumCore2Calldata65`
   lit A et t1 en place.
4. Dans le même mouvement, `UseHint` passe à un `mul` pour Decompose (exact
   pour tout r < q, vérifié exhaustivement) et un `mul` pour l'empaquetage,
   et `SampleInBall` tire sur un tableau d'octets (`mstore8`) empaqueté une
   fois à la fin. Détail et mesures dans VERSION.md.

**Alternatives écartées**

- *Garder la représentation packée et pré-extraire les champs de clé.* La
  clé est lue une fois par ligne, il n'y a rien à amortir ; l'extraction par
  champ (deux opérations et deux constantes) est le coût que la scission
  supprime.
- *Scission en lanes séparées (un mot par lane).* Déjà mesurée en septembre
  (+26 k sur le 44) : un `mload` à adresse calculée coûte plus qu'un masque.
- *Passe intra-mot de la NTT en Montgomery packé* (deux produits par `mul`
  là aussi) : +2,9 k par transformée et +2,5 Ko par contrat contre les
  `mulmod` scalaires, à cause des constantes de 32 octets ; retirée.
- *Changer le format de clé* (champs de 64 bits, ou colonnes transposées pour
  un produit scalaire par `mul`) : le format est une entrée du contrat, hors
  périmètre, et doublerait le calldata du 65.

**Conséquences**

- `make bench` : 44 NIST 1 189 532 → 1 081 811, ETH 840 309 → 735 767, 65
  1 549 610 → 1 284 828 (+538 132 de calldata inchangés), puis, avec la suite
  du même jour (z lazy, lignes dans les tableaux de z, un pointeur de clé par
  ligne, hints par mot, borne de z accumulée, VERSION.md), 1 047 209 /
  701 975 / 1 241 421. Tailles 24 383 → 24 225 (marge EIP-170 193 → 351),
  20 278 → 20 149, 23 712 → 22 609 (marge 864 → 1 967).
- Signatures des fonctions conservées : `_matvecRowPacked` /
  `_matvecRowPacked65` (forme de référence : scission puis noyau),
  `readPubKeyCalldata65`, `dilithiumCore2Packed65`, `useHintPacked65`,
  `sampleInBallFast` et `sampleInBallFastTau` rendent les mêmes valeurs ;
  les deux `verify` et `setKey` du 65 sont inchangés. Nouvelles fonctions
  internes : `_splitLanes`, `_matvecRowSplit`, `_matvecRowCalldata65`,
  `checkPubKeyCalldata65`, `dilithiumCore2Calldata65`, `_packBallCodes`,
  `nttFwMontPackedFusedTbSplit`.
- `dilithiumCore2Packed` / `dilithiumCore2Packed65` ne transforment plus z et
  c « en place » : les tableaux servent de brouillon aux deux premières
  passes, puis reçoivent les lignes du matvec et leur transformée inverse.
  Aucun appelant ne les relisait. Les lanes de z que `dilithiumCore1Packed*`
  passe au second étage sont lazy (dans (0, 2q)) ; les décodeurs canoniques
  restent la référence des tests.
- La passe intra-mot scalaire et la table de twiddles restent telles quelles ;
  la place EIP-170 regagnée sur le 44 vient du noyau plus court, malgré les
  constantes de l'empaquetage de UseHint.

## ADR-010 — ML-DSA-44 : clé en calldata seule, même forme que le 65

**Contexte**

Depuis ADR-007 le 65 ne connaît qu'une clé passée dans le calldata de chaque
vérification ; le 44 gardait le pointeur SSTORE2 (ADR-002/003) : une
installation de 4 759 850 gas par clé (blob ABI de 22 401 octets), puis une
copie à chaque vérification. Deux formes de clé pour le même code, et le
dépôt de code que l'EIP-8037 propose de porter à 1 530 gas par octet
(≈ 34,7 M pour cette clé) ne laisse au SSTORE2 qu'une niche.

**Décision**

`ZKNOX_dilithium` prend la forme exacte de `ZKNOX_dilithium65` : aucun état,
`setKey(bytes calldata) returns (bytes)` contrôle la longueur et rend la clé,
les deux `verify` prennent les 21 216 octets, en vérifient la forme
(`checkPubKeyCalldata` : vingt mots de longueur à 32 puis un à 64) et lisent
A et t1 en place (`dilithiumCore2Calldata`, `calldataload` dans le noyau de
ligne), tr tranché pour mu. Layout plat identique à celui du 65 : polynôme f
en f·1056 (A[i][j] pour f = 4i + j, t1[i] pour f = 16 + i), `[32][32 mots]`
chacun, puis tr `[64][64 octets]` ; `encodePubKeyFlat(aHat, tr, t1)` en
Solidity, `prepare_pk_for_deployment.py … flat` en Python (le keccak des deux
sorties coïncide), `readPubKeyCalldata` est la lecture de référence des tests.
`ZKNOX_ethdilithium` garde son blob SSTORE2 et `readPubKeyPacked`, que
`Deploy_MLDSA_PK.s.sol` continue de déployer (`run()`) à côté de `flatKey()`.

**Alternatives écartées**

- *Deux chemins dans le même contrat* : déjà écarté pour le 65 (ADR-006) ;
  la marge EIP-170 du 44 (351 octets avant) l'interdisait de toute façon.
- *Compacter la clé pour le calldata* : hors règle (format d'entrée), et
  non rentable (VERSION.md 2026-10-21 (3)).

**Conséquences**

- Par vérification, 269 328 gas de calldata pour la clé (309 468 avec la
  signature, total transaction 1 332 382, plancher EIP-7623 794 510) contre une
  copie d'environ 22 k dans l'ancienne forme : le point mort face au SSTORE2
  est d'environ 19 vérifications par clé aujourd'hui, 140 après EIP-8037.
  L'exécution passe de 1 047 209 à 1 032 792 par la seule conversion (copie
  et expansion mémoire en moins), 1 006 093 avec ADR-011.
- API : `verify(bytes pk, bytes m, bytes sig, bytes ctx)` et
  `verify(bytes pk, bytes32 m, bytes sig)` ont les mêmes signatures, `pk`
  étant la clé et non plus l'ABI-encodage d'un pointeur ; `setKey` rend la
  clé au lieu de déployer. Erreurs : `BadKeyLength`, `BadPubKeyBlob` (forme),
  `InvalidSignatureLength`, `ContextTooLong`, `BadHelper`.
- Tests : `test/dilithium_key.t.sol` (forme de la clé, identité de `setKey`,
  encodeur réciproque du lecteur, égalité avec le blob, rejets, coût d'une
  transaction) ; `dilithium.t.sol`, `dilithiumKATS.t.sol`, `benchmarks.t.sol`
  et `DeployDilithiumInternal.s.sol` passent par `encodePubKeyFlat`.

## ADR-011 — Passe intra-mot inverse repliée dans le matvec, table de twiddles recomposée, sorties en place par modules décalés

**Contexte**

Après ADR-008 chaque ligne du second étage coûtait un noyau de matvec (32 k,
dont la fusion des deux accumulateurs et l'écriture de 64 mots) suivi de
l'inverse complète (43 k, dont 20 k pour le premier bloc, la passe intra-mot
t = 1, 2 qui relit chaque mot, en extrait quatre lanes, fait quatre
`mulmod`, deux `addmod`, trois `shl` et trois `or`). Les noyaux NTT
assemblaient en outre, à chaque bloc de huit mots de la seconde passe, un mot
de sept twiddles à partir de trois sections de la table (25 opérations), et
la passe repliée aurait eu besoin, par corps de boucle, de la moitié d'un mot
de la section t = 2.

**Décision**

1. *Repli.* Les deux accumulateurs d'un mot (lanes 0-2 dans le pair, 1-3 dans
   l'impair) sont ses quatre lanes brutes : la passe intra-mot les prend sur
   la pile, forme `s = e + o` et `d = e + q·2^30 − o` sur les deux moitiés
   (128 bits d'écart) d'un coup, puis les quatre résultats, et écrit le mot
   une fois. Le reste de l'inverse (`nttInvMontPackedTailTb`, les passes B'
   et A' du noyau complet, inchangées) part des mots écrits. Trois noyaux :
   `_matvecRowInvCCalldata`, `_matvecRowInvCCalldata65` (clé en calldata),
   `_matvecRowInvCSplit` (clé en mémoire, ETH), engendrés par le même
   script ; `_matvecRowSplit*` et `nttInvMontPackedRawFusedTb` restent la
   forme de référence (`dilithiumCore2Packed65`, tests).
2. *Sorties en place.* Pour un `mulmod(x, w·2^k, q·2^k)` le résultat est
   `(x·w mod q)·2^k` : le twiddle extrait au bit 64 (bit 128) avec le module
   q·2^64 (q·2^128, q·2^192 pour la lane 3, produit des différences déjà au
   bit 64 par le twiddle au bit 128) livre la lane là où elle va, `addmod`
   de même ; le mot est trois `or`. Les modules sont des constantes de 11,
   19 et 27 octets.
3. *Table.* Les mots 0..7 de chaque moitié de `_TW_MONT` reçoivent les mots
   composés de la seconde passe (t = 16 au bit 0, t = 8 en 32 et 64, t = 4 en
   96..192), que les noyaux ne lisaient pas autrement (la première passe a
   ses twiddles en littéraux) : un `mload` par bloc. Dans la moitié inverse,
   les mots t = 2 ont leurs moitiés permutées (mot j au champ j ^ 4) : les
   quatre twiddles d'un corps de boucle de la passe repliée (deux mots de
   clé, quatre mots de sortie) sont le haut des 32 octets lus à l'octet 16k
   de la section, une lecture non alignée et un pas de 16 octets ; le premier
   bloc du noyau complet change ses décalages constants en conséquence. Les
   tables mémoire des noyaux de référence (`_fwTableMont`, `_invTableMont`)
   ne bougent pas.

**Alternatives écartées**

- *Passe intra-mot en Montgomery packé* (directe) : +1,2 k par transformée,
  +1 Ko ; `mulmod` à 8 gas est imbattable par treize opérations de réduction.
- *Corps de boucle à quatre mots de clé* : −3 / −4,4 k mais +2,3 Ko, hors
  EIP-170.
- *Section t = 2 dupliquée à quatre twiddles par mot* : +1 Ko de table par
  contrat pour le même effet que la permutation des moitiés.

**Conséquences**

- `make bench` : 44 1 032 792 → 1 006 093, 65 1 241 421 → 1 198 467, ETH
  701 975 → 679 733 ; tailles 22 787 (marge 1 789), 23 642 (marge 934), 20 444.
- Bornes : les lanes brutes des accumulateurs restent < q·2^30 (ADR-008) ;
  les décalages de sortie ne changent pas les valeurs, qui restent
  canoniques. `test/NTT_dilithium_mont.t.sol` compare les noyaux Tb au noyau
  packé et aux formes scalaires ; les vérifications complètes (KAT, ACVP,
  ecml-signer) couvrent les tables.
- Le format de `_TW_MONT` est propre aux noyaux `…Tb` ; tout nouveau lecteur
  de la table doit prendre les mots 0..7 composés et la permutation t = 2 de
  la moitié inverse (voir le commentaire de la constante).
