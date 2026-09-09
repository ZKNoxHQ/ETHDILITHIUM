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
