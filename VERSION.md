# VERSION.md — changelog

## [unreleased] — 2026-10-21 (4) — ML-DSA-44 en calldata, passe intra-mot inverse repliée dans le matvec, table recomposée, signature lue en place

### Measured (`make bench`, profil par défaut, 113/113 tests, profil lite 113/113, `make test_kat100` 2/2)
| | fcfc3fe | 2026-10-21 (3) | **après** | delta total |
|---|---:|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST, ML-DSA-44, exécution) | 1 189 532 | 1 047 209 | **1 006 093** | −15,4 % |
| `ZKNOX_ethdilithium.verify` (ETH) | 840 309 | 701 975 | **679 733** | −19,1 % |
| `ZKNOX_dilithium65.verify` (ML-DSA-65, exécution) | 1 549 610 | 1 241 421 | **1 198 467** | −22,7 % |
| runtime size 44 / 65 / ETH (marge EIP-170) | 24 383 (193) / 23 712 (864) / 20 278 | 24 225 (351) / 22 609 (1 967) / 20 149 | **22 787 (1 789) / 23 642 (934) / 20 444** | |

Le chiffre du 44 est désormais, comme celui du 65, de l'exécution seule : sa
clé (21 216 octets) voyage dans le calldata de chaque vérification, 269 328
gas de calldata pour la clé, 309 468 avec la signature (`test/dilithium_key.t.sol`,
total transaction 1 332 382, plancher EIP-7623 794 510). Le 65 : 538 132 de
calldata, inchangés.

### Changed
- **ML-DSA-44 : clé en calldata, contrat sans état** (DECISIONS.md ADR-010).
  `ZKNOX_dilithium` prend la forme de `ZKNOX_dilithium65` : `setKey(bytes)`
  vérifie la longueur et rend la clé, `verify(pk, m, sig, ctx)` et
  `verify(pk, bytes32, sig)` prennent les 21 216 octets et les lisent en
  place (`checkPubKeyCalldata`, `dilithiumCore2Calldata`). Même layout plat que
  le 65 : 20 polynômes `[32][32 mots]` (A[i][j] en (4i+j)·1056, t1[i] en
  (16+i)·1056) puis tr `[64][64 octets]` ; `encodePubKeyFlat` le construit à
  partir des trois tableaux, `pythonref/prepare_pk_for_deployment.py … flat`
  à partir d'une graine (le mode `abi` garde le blob SSTORE2 de
  `ZKNOX_ethdilithium`). Le dépôt SSTORE2 disparaît du 44 ; l'ETH le garde.
- **Passe intra-mot de la NTT inverse repliée dans le matvec** (ADR-011) :
  les deux accumulateurs d'un mot (lanes 0-2 et 1-3) sont ses quatre lanes
  brutes, la passe t = 1, 2 les prend sur la pile au lieu de relire un mot
  stocké, forme sommes et différences décalées sur les deux moitiés d'un
  coup, et le reste de l'inverse (`nttInvMontPackedTailTb`, passes B' et A')
  part des mots écrits. Noyaux `_matvecRowInvCCalldata` / `…65` (clé en
  calldata) et `_matvecRowInvCSplit` (clé en mémoire, ETH) ; deux mots de
  clé (quatre mots de sortie) par corps de boucle, twiddles à décalages
  constants.
- **Sorties de la passe intra-mot produites en place** : le twiddle est
  déplacé au bit 64 (128) et le module est q·2^64 (q·2^128, q·2^192), si bien
  que `mulmod` / `addmod` rendent la lane là où elle va — plus aucun `shl`
  de sortie. Appliqué au premier bloc de `nttInvMontPackedRawFusedTb` aussi.
- **Table de twiddles recomposée** (`_TW_MONT`) : les mots 0..7 de chaque
  moitié portent les sept twiddles de la seconde passe composés par bloc (le
  mot que les noyaux assemblaient à chaque bloc à partir des mots 1..7, qu'ils
  ne lisaient pas autrement) : −9 à −12 k ; dans la moitié inverse, les deux
  moitiés des mots t = 2 sont permutées (mot j au champ j ^ 4), de sorte que
  les quatre twiddles d'un corps de boucle sont le haut d'une lecture non
  alignée à pas de 16 octets.
- **Signature lue en place** : `dilithiumCore1PackedCalldata` / `…65` décodent
  z depuis le calldata (`_unpackZPackedLazyCalldata*`, mêmes décodeurs,
  `calldataload` pour `mload`) ; seuls c~ et h sont copiés : −1,5 k.
- **UseHint 65** : quatre mots par itération, un `mstore` de 8 octets (les
  copies parasites de l'empaquetage restent sous le bit 192) : −6,7 k.
- Boucles des passes B / B' bornées par le pointeur avec un pointeur de table
  courant ; test d'indices de hints sans branchement.

### Où en est le profil (65, 1 198 467)
Neuf permutations Keccak 385 k (32 %) ; six NTT directes 242 k ; six matvec
avec passe intra-mot repliée 298 k (dont ~190 k de produits : 10 opérations par
produit, plancher) ; six queues d'inverse 133 k ; unpackZ 69 k ; SampleInBall
61 k dont 43 k de permutation ; UseHint 47 k ; mu 43 k ; hints 5 k ; table
1,5 k ; expansion mémoire ~12 k (57 Ko). 44 (1 006 093) : cinq NTT 201 k,
quatre matvec 179 k, queues 89 k, UseHint 62 k (80 hints), unpackZ 55 k.

### Tried and discarded (mesuré)
- Passe intra-mot directe en Montgomery packé (deux `mul` par mot au lieu de
  quatre `mulmod`, table t = 2 / t = 1 en forme de Montgomery et paires à
  64 bits) : +1,2 k par transformée et +1 Ko par contrat. `mulmod` à 8 gas
  bat la réduction de Montgomery (treize opérations) ; le gain de lanes se
  perd en masques et repositionnements.
- Corps de boucle du matvec à quatre mots de clé (huit mots de sortie,
  twiddles sans pré-décalage) : −2,9 k (44) / −4,4 k (65) mais +2,3 Ko, au-delà
  d'EIP-170 sur les deux contrats.
- UseHint 44 à quatre mots par itération : −0,6 k pour +1,1 Ko (l'empaquetage
  6 bits reste à deux mots par `mstore`, ses copies montent au bit 196).
- Formulations de la passe repliée (lanes scalaires, sommes d'abord, sans
  réaffectation) : ±0,5 k par ligne, la forme à moitiés packées gardée.
- Boucles bornées par pointeur dans les passes A et C des noyaux NTT : +1 à
  +3 k selon le contrat, seule la passe B gagne.

## [unreleased] — 2026-10-21 (3) — gas, fin de série : hints par mot, borne de z accumulée, forme de la clé déroulée, empaquetage SampleInBall

### Measured (`make bench`, profil par défaut, 106/106 tests, profil lite 106/106, `make test_kat100` 2/2)
| | fcfc3fe | 2026-10-21 (2) | **après** | delta total |
|---|---:|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST, ML-DSA-44) | 1 189 532 | 1 057 611 | **1 047 209** | −12,0 % |
| `ZKNOX_ethdilithium.verify` (ETH) | 840 309 | 711 817 | **701 975** | −16,5 % |
| `ZKNOX_dilithium65.verify` (ML-DSA-65, exécution) | 1 549 610 | 1 252 837 | **1 241 421** | −19,9 % |
| runtime size 44 / 65 / ETH (marge EIP-170) | 24 383 (193) / 23 712 (864) / 20 278 | 24 054 (522) / 22 406 / 20 090 | **24 225 (351) / 22 609 (1 967) / 20 149** | |

### Changed
- **UseHint** : dans une paire de mots à hint, seul le mot qui en porte est
  ajusté (deux tests de quartet sous le test de la paire) : −4,8 k (65),
  −6,2 k (44).
- **unpackZ** : la borne de norme s'accumule par `and` des deux termes
  (bit 24 par lane) et se teste une fois en sortie, au lieu d'un `xor` et
  d'un `or` par groupe : −5 k (65), −3 k (44).
- **checkPubKeyCalldata65** : les 36 mots de longueur sont contrôlés quatre
  par itération, en un seul `or` de différences : −1,5 k.
- **SampleInBall** : empaquetage des codes deux mots par itération : −0,8 k.

### Où en est le profil (65, 1 241 421)
Neuf permutations Keccak 385 k (31 %, fixées par FIPS 204 et le helper) ;
douze NTT ~505 k (41 % ; dans chaque transformée les deux étages intra-mot
scalaires pèsent 45 à 48 %, et la version packée de ces étages reste plus
chère) ; matvec 197 k (983 gas par mot de clé contre un plancher
d'instructions d'environ 860) ; unpackZ ~68 k (dont 150 par paire de groupes
pour l'inversion d'octets) ; SampleInBall 62 k dont 43 k de permutation ;
UseHint ~51 k ; mu 43 k ; le reste (~12 k) est de la glu. Ce qui subsiste
au-dessus des planchers d'instructions est l'ordonnancement de pile du
pipeline IR (15 à 30 % selon la boucle), que l'écriture des noyaux ne
contrôle que partiellement.

### Tried and discarded (mesuré)
- Boucle de tirages de SampleInBall sortie de l'inlining par un auto-appel
  jamais pris : −0,7 k (44) / +0,2 k (65) ; retirée. La boucle inlinée n'est
  pas celle aux longues chaînes de swaps (c'est la boucle de secours, jamais
  exécutée).
- Clé 65 en champs de 23 bits (hors règle, évalué seulement) : le format
  actuel coûte 482 k de calldata parce qu'un octet sur quatre est nul (4 gas) ;
  compacté, 425 k, soit −57 k pour un dépaquetage on-chain d'environ 90 k.
  Non rentable.

## [unreleased] — 2026-10-21 (2) — gas, suite : z lazy, lignes dans les tableaux de z, un pointeur de clé par ligne, sommes lazy de la première passe inverse, parseur de hints

### Measured (`make bench`, profil par défaut, 106/106 tests, profil lite 106/106, `make test_kat100` 2/2)
| | fcfc3fe | 2026-10-21 (1) | **après** | delta total |
|---|---:|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST, ML-DSA-44) | 1 189 532 | 1 081 811 | **1 057 611** | −11,1 % |
| `ZKNOX_ethdilithium.verify` (ETH) | 840 309 | 735 767 | **711 817** | −15,3 % |
| `ZKNOX_dilithium65.verify` (ML-DSA-65, exécution) | 1 549 610 | 1 284 828 | **1 252 837** | −19,2 % |
| runtime size 44 / 65 / ETH (marge EIP-170) | 24 383 (193) / 23 712 (864) / 20 278 | 24 127 (449) / 22 556 / 20 163 | **24 054 (522) / 22 406 (2 170) / 20 090** | |

Profil du 65 après (exécution) : hachage final 292 k, six NTT directes
248 k (scission et expansion mémoire comprises), six inverses 260 k, matvec
197 k, unpackZ 74 k, SampleInBall 62 k (42,8 k de permutation), UseHint 56 k,
mu 43 k, hints 5 k, forme de la clé 2,7 k, glue ~5 k.

### Changed
- **z en lanes lazy** : `unpackZPackedLazy` / `unpackZPackedLazy65` écrivent
  q + γ1 − f dans (0, 2q) sans la soustraction conditionnelle de q ;
  `dilithiumCore1Packed` / `dilithiumCore1Packed65` les utilisent. La NTT
  directe accepte des lanes < 2q (chaque biais des couches packées est 2q,
  produits < 2^50), sa borne de sortie passe de 16q à 17q, la borne documentée
  du matvec. `unpackZPacked` / `unpackZPacked65` (canoniques, référence des
  tests) sont inchangées, les trois partagent un décodeur à drapeau. −9,7 k
  (44, ETH), −12,2 k (65). Test ajouté : le noyau scindé sur des lanes x + q.
- **Lignes du matvec dans les tableaux de z** : `_matvecRowSplit` et
  `_matvecRowCalldata65` prennent le tableau de destination ; les cores
  écrivent les lignes dans les z (et c) packés, morts depuis la scission, au
  lieu d'allouer 2 Ko par ligne. −6 k (65), −4,6 k (44) d'expansion mémoire.
- **Un pointeur de clé par ligne** : les polynômes de la ligne sont lus à
  `pa + j·1056` et t1 à `pa + dt` (format du blob et de la clé calldata) au
  lieu de six pointeurs incrémentés ; `_matvecRowSplit` vérifie la contiguïté
  et recopie la ligne dans ce format sinon (lignes de test non contiguës).
  −5 k (65), −2 k (44).
- **Première passe inverse** (`nttInvMontPackedRawFusedTb`) : les deux sommes
  de la couche t = 1 restent brutes (`add` pour `addmod`, < q·2^31), la
  différence de la couche t = 2 prend un décalage q·2^31 ; −1 k par
  transformée. Le noyau non fusionné de référence est inchangé.
- **Parseur de hints** : la stricte croissance des indices est le test
  « nouveau bit au-dessus du masque » (`gt(shl(idx, 1), m)`), les octets
  d'index inutilisés sont contrôlés un mot à la fois ; −2,5 k (65), −3,3 k (44).

### Tried and discarded (mesuré)
- UseHint à quatre mots par itération (un store de 8 octets) : +1,8 k sur le
  65 (pression de pile et constantes) ; deux mots gardés.
- SampleInBall : tirages dans une fonction Solidity séparée à deux appelants,
  puis deux octets par itération : +0,4 k et +0,9 k (la boucle est de toute
  façon inlinée dans `verifyInternal`, avec ses chaînes de swaps) ; version
  à fonction Yul conservée.
- Séquence d'optimisation Yul explicite dans `foundry.toml` : l'IR ne compile
  plus (« too deep in the stack » dans SampleInBall) ; profil ADR-004 inchangé.
- Pour mémoire, les pistes évaluées sans suite : transposition 4×4 avant les
  étages intra-mot (deux transpositions par transformée annulent le gain),
  trois produits par `mul` dans le matvec (impossible avec des champs de clé
  espacés de 32 bits, recherche exhaustive), mise à l'échelle n⁻¹ déplacée
  vers z et c (même nombre de polynômes), réduction de Shoup à la place de
  Montgomery (même coût).

## [unreleased] — 2026-10-21 — gas : matvec à deux produits par multiplication, clé 65 lue en calldata, UseHint et SampleInBall sans boucles de lanes

### Measured (`make bench`, profil par défaut, 104/104 tests, `make test_kat100` 2/2)
| | avant | **après** | delta |
|---|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST, ML-DSA-44) | 1 189 532 | **1 081 811** | −9,1 % |
| `ZKNOX_ethdilithium.verify` (ETH) | 840 309 | **735 767** | −12,4 % |
| `ZKNOX_dilithium65.verify` (ML-DSA-65, exécution) | 1 549 610 | **1 284 828** | −17,1 % |
| `ZKNOX_dilithium65.verify`, transaction (calldata 538 132 inclus) | ~2 108 000 | **~1 844 000** | −12,5 % |
| runtime size 44 / 65 / ETH (marge EIP-170) | 24 383 (193) / 23 712 (864) / 20 278 | **24 127 (449) / 22 556 (2 020) / 20 163** | |

Profil du 65 après (exécution, `verify(pk, m, sig, "")`) : hachage final
292 k (7 permutations, fixé par FIPS 204), six NTT directes 236 k, six
inverses 267 k, matvec 210 k, unpackZ 86 k, SampleInBall 63 k (dont 42,7 k
de permutation), UseHint 57 k, mu 43 k, hints 7,5 k, contrôle de forme de la
clé 2,7 k. Plancher des neuf permutations : 385 k.

Référence Fireblocks ML-DSA-44 : 1 224 368 ; le 44 est maintenant 142 557 en
dessous.

### Changed
- **Matvec à deux produits par `mul`** (`_matvecRowSplit` / `_matvecRowSplit65`,
  DECISIONS.md ADR-008). Les z transformés et c sont écrits en « lanes
  scindées » : pour quatre coefficients, un mot pair (c0 en 0, c2 en 64) et un
  mot impair (c1 en 32, c3 en 96). Contre le mot de clé masqué à ses champs
  pairs (f0 en 0, f2 en 64) ou impairs (f1 en 32, f3 en 96), une
  multiplication donne deux produits voulus sur des lanes de 64 bits et deux
  produits croisés sur d'autres lanes ; deux accumulateurs (pair : lanes 0 et
  2, impair : lanes 1 et 3) sont fusionnés par masques. 24 `mul` par mot de
  clé au lieu de 48, aucune extraction de champ côté clé (un masque par
  produit, un décalage de 128 par mot pour les quatre champs hauts), aucune
  côté z. Bornes : lanes voulues inchangées (< q·2^30, celle de la première
  passe inverse), lanes croisées < 2^54 avec un décalage de 2^60 à la place de
  q·2^28 pour que la soustraction de c·t1 n'emprunte jamais, puis masquées.
  Matvec du 65 : 428 657 → 210 505 ; du 44 : −~100 k.
- **Scission écrite par la NTT directe** : `nttFwMontPackedFusedTbSplit(A, tb, d)`
  (copie du noyau fusionné dont la dernière passe écrit les deux mots scindés
  au lieu du mot packé), donc aucune passe de scission ; `dilithiumCore2Packed`
  et `dilithiumCore2Packed65` l'appellent sur les z et sur c, qui ne sont plus
  « transformés en place » mais laissés dans l'état des deux premières passes.
  `_splitLanes` / `_splitLanes65` restent la forme de référence (tests), et
  `_matvecRowPacked` / `_matvecRowPacked65` gardent leur signature (scission
  puis noyau).
- **ML-DSA-65 : la clé reste dans le calldata.** `checkPubKeyCalldata65`
  contrôle la forme (même règle que `readPubKeyCalldata65`), puis
  `dilithiumCore2Calldata65` lit A et t1 par `calldataload`
  (`_matvecRowCalldata65`) et `tr` est tranché pour mu : plus de copie des
  38 112 octets, −29 k (copie et expansion mémoire quadratique de tout ce qui
  suivait). `readPubKeyCalldata65` et le `verifyInternal(PubKey memory, …)`
  restent (forme de référence, tests), une surcharge `verifyInternal(bytes
  calldata, …)` sert les deux `verify`.
- **UseHint** (`useHintPacked`, `useHintPacked65`) :
  a1 = ⌊(r + γ2 − 1) / 2γ2⌋ par une multiplication par ⌈2^48 / 2γ2⌉ et un
  décalage (exact pour tout r < q, vérifié exhaustivement, produits de lane
  < 2^54), à la place de la double approximation ; empaquetage des quatre
  valeurs d'un mot vers leurs octets big-endian par multiplication (une pour
  le 65 : lane k → bits 248, 252, 240, 244 ; deux pour le 44 après
  séparation des bits qui restent dans leur octet et de ceux qui changent
  d'octet), les autres copies tombant sous les bits gardés ; deux mots par
  itération, un store de 4 (65) ou 6 (44) octets. Pour le 65, l'ajustement
  des lanes à hint est désormais lane-parallèle (comme le 44) au lieu d'une
  boucle scalaire par lane : 110 k → 57 k (signature du KAT). 44 : 89 k →
  73 k (80 hints aléatoires).
- **SampleInBall** (`sampleInBallFastTau`, `sampleInBallFast` = tau 39) : les
  tirages opèrent sur un tableau de 256 codes d'un octet (0, 1, 2 pour −1 :
  une lecture d'octet et deux `mstore8` par tirage, un seul parcours des
  octets du bloc avec `continue`), empaqueté une fois à la fin
  (`_packBallCodes` : quatre codes par mot vers leurs lanes par une
  multiplication, 2 → q − 1). 69,5 k → 63 k. Même flux d'octets, même
  polynôme.
- **unpackZ** : contrôle de borne combiné (bit 24 de (f + 2^24 − lo) ET de
  (2^24 + hi − f)), masque de groupe fondu dans les masques de champs, second
  groupe écrit à `dst + 32` : 65 : 90,8 k → 85,7 k (avec le masque de
  groupe retiré) ; 44 : 84 k → 81 k.
- Vérification de forme de `dilithiumCore2Packed` (44) portée dans la fonction
  (elle venait de `_matvecRowPacked`).

### Added
- `test/NTT_dilithium_mont.t.sol` : `testFuzz_fw_split_matches_packed_split`
  et `test_fw_split_saturated` (le noyau à sortie scindée égale, mot pour
  mot, le noyau packé suivi de `_splitLanes`).

### Tried and discarded (mesuré)
- Passe intra-mot de la NTT directe en Montgomery packé (lanes 2-3 puis 1-3
  multipliées par leurs twiddles en forme de Montgomery, une réduction par
  paire, papillons sur demi-mots, table de 24 mots en plus) : +2,9 k par
  transformée et +2,5 Ko de code par contrat contre les `mulmod` scalaires ;
  retirée.
- Twiddles pré-multipliés par QINV dans les passes packées : coût identique
  (le `and(t, m32)` économisé est remplacé par le PUSH de la constante).
- Scission en deux mots compacts de 32 bits par mot packé (moitié de
  mémoire) : +6 par `mul` dans le noyau, gain nul.

## [unreleased] — 2026-10-20 (4) — compatibilité avec le signer Ledger ecml-signer

### Added
- `test/ecml_signer_compat.t.sol` (2 tests) et `test/KAT/ecml_device_vectors.json` :
  trois signatures ML-DSA-65 du binaire release d'ecml-signer v2.4.0
  (`build/nanos2/bin/app.elf`, e2fee68, SDK v27.1.2) exécuté sous speculos,
  seed speculos par défaut, chemin m/44'/60'/0'/0/0 : deux `HYBRID_SIGN_HASH`
  (0x16) et un `SIGN_TX_MLDSA` (0x08), P2 = ML-DSA-65. Clé publique de 1952
  octets du device étendue par `publicKeyToBlob65`, puis `verify(pk, bytes32, sig)`
  et `verify(pk, m, sig, "")` acceptés ; autre digest, contexte non vide et
  bit retourné dans c~, z ou h rejetés. `verify` 1 546 129 à 1 552 243 gas
  (exécution, hors intrinsèque).

### Changed (documentation seule)
- Doc du 65 alignée sur ADR-007 (clé en calldata, plus de SSTORE2) :
  natspec de `ZKNOX_dilithium65.sol`, `README.md` (section ML-DSA-65, chiffres
  `make bench` 1 549 610 plus 538 132 de calldata, taille 23 712), `js/README.md`,
  en-têtes de `js/mldsa65.js` et `js/sign65.js` (`encodePublicKey65` /
  `publicKeyToBlob65`, clé de 38 112 octets). Section signer hardware
  ecml-signer ajoutée aux deux README.
- Imports `SSTORE2` inutilisés retirés de `test/dilithium65_core_packed.t.sol`
  et `test/dilithium65_vectors.t.sol`.
- Code de `ZKNOX_dilithium65` inchangé (23 712 octets identiques), mais la
  natspec entre dans le hash de métadonnées : le bytecode final change, donc
  l'adresse CREATE2 du sel `ZKNOX_MLDSA65_v0.1` aussi.

## [unreleased] — 2026-10-20 (3) — ML-DSA-65 : clé en calldata seule, chemin SSTORE2 retiré

### Measured
| | avant (pointeurs) | **après (calldata)** |
|---|---:|---:|
| `verify`, transaction complète | ~1 620 000 | **2 107 680** |
| dont calldata (41 760 octets) | 55 744 | **538 132** |
| dont exécution | 1 543 311 | **1 548 548** |
| installation d'une clé, aujourd'hui | 8 513 784 | **0** |
| installation d'une clé, après EIP-8037 | 59 202 744 | **0** |
| runtime size (marge EIP-170) | 24 385 (191) | **23 712 (864)** |
| contrats à déployer par chaîne | 2 | **1** |

Seuil de bascule des deux chemins : 17 vérifications par clé aujourd'hui, 122
après EIP-8037. Aucun cas visé (vault, satellite, signataire de Safe) n'en
approche, et aucun détenteur ne paiera 59,2 M d'avance pour installer une clé.
DECISIONS.md ADR-007. Le plancher EIP-7623 (1 366 170) reste sous le coût
standard. ML-DSA-44 et ETH inchangés.

### Removed
- Le chemin SSTORE2 du 65 : `storeBlob`, `packKey`, `readPubKeyPacked65`, les
  constantes de blob, `test/dilithium65_deploy.t.sol`, le second script de
  déploiement. L'ancien `ZKNOX_dilithium65.sol` à pointeurs est supprimé.

### Changed
- `ZKNOX_dilithium65` est le vérifieur à clé en calldata (ex
  `ZKNOX_dilithium65_calldata`), et le seul. `setKey` contrôle la longueur et
  rend son argument ; rien n'est écrit on-chain.
- `readPubKeyCalldata65(bytes calldata)` remplace le lecteur de pointeurs. Le
  format plat d'ADR-005 est conservé : 36 polynômes `[32][32 mots]` puis `tr`,
  38 112 octets, parcourus par arithmétique.
- `js/mldsa65.js` : `encodePublicKey65` remplace `encodePublicKeyBlob65` et rend
  la clé seule ; `BLOB_BYTES65` et consorts remplacés par `KEY_POLYS65` et
  `KEY_BYTES65`.
- `test/KAT/mldsa65_kat0.json` : `blob0`..`blob3` retirés, `blob` conservé
  (régénérer avec `node js/gen_test_vectors65.js 10`).
- `test/dilithium65_key.t.sol` (ex `dilithium65_calldata.t.sol`, 6 tests) :
  identité de `setKey`, KAT NIST, entrée ISigVerifier, 28 vecteurs ACVP, rejets,
  clés malformées, et le coût d'une transaction avec le contrôle du plancher
  EIP-7623.
- `test/dilithium65_core_packed.t.sol` : `test_readPubKeyCalldata65` remplace le
  test du lecteur de pointeurs, mêmes cas de rejet transposés à la clé plate.

### Added
- `make test_kat100` : les 100 vecteurs de `PQCsignKAT_Dilithium3.rsp` en une
  fois (le fichier commité en garde 10). La cible régénère à 100, lance
  `test/dilithium65_vectors.t.sol` sous le profil `kat100`, puis restaure le
  fichier commité, y compris en cas d'échec. Environ 25 s et un fichier
  temporaire de 10,7 Mo, chaque vecteur portant sa clé étendue de 38 112
  octets. Le profil relève le gas et la mémoire : la seule expansion mémoire
  d'un appel dépasse la limite par défaut de 2^30 et sort en `MemoryOOG`.

### Tests
100/100, et 118 vecteurs sous `make test_kat100`.

## [unreleased] — 2026-10-20 (2) — ML-DSA-65 : variante à clé publique en calldata

### Measured (`forge test --match-path test/dilithium65_calldata.t.sol -vv`)
| | pointeurs SSTORE2 | **clé en calldata** |
|---|---:|---:|
| exécution du vérifieur | 1 543 311 | 1 546 030 |
| calldata de l'appel | 55 744 | 538 132 |
| **total transaction** | **1 620 055** | **2 105 162** |
| installation de la clé, aujourd'hui | 8 513 784 | 0 |
| installation de la clé, après EIP-8037 | 59 202 744 | 0 |
| runtime size (marge EIP-170) | 24 385 (191) | 23 712 (864) |

Les deux vérifieurs coûtent presque la même chose à exécuter : atteindre quatre
contrats de blob froids et copier leur code vaut à peu près ce que coûte la
copie des mêmes octets depuis le calldata. Toute la différence est le calldata,
485 107 de plus par vérification, contre une installation qui disparaît.
**Seuil de bascule : 17 vérifications par clé aujourd'hui, 122 après EIP-8037.**
En dessous, la variante calldata ; au-dessus, ZKNOX_dilithium65. Le plancher
EIP-7623 (1 366 170) reste sous le coût standard, donc sans effet.

### Added
- `src/ZKNOX_dilithium65_calldata.sol` — ML-DSA-65 avec la clé étendue passée
  dans le calldata de chaque vérification. Aucun état : `setKey` contrôle la
  longueur et rend son argument, l'appelant garde ces octets comme `pk` et les
  engage par keccak256 comme il le fait déjà d'un handle de pointeurs, si bien
  que le lien clé-compte reste dans le compte. Mêmes noyaux et mêmes octets de
  clé que `ZKNOX_dilithium65` : une clé passe d'un vérifieur à l'autre sans
  réencodage.
- `readPubKeyCalldata65(bytes calldata)` dans le noyau packé. La concaténation
  des quatre blobs est déjà la suite plate que lit ce vérifieur — polynôme f à
  l'offset f × 1 056, puis tr — donc l'argument accepté est exactement celui de
  `setKey` côté SSTORE2.
- `test/dilithium65_calldata.t.sol` (7 tests) : KAT NIST et 28 vecteurs ACVP par
  le chemin calldata, rejets de signature, message et contexte, clés malformées
  (longueur, mot de longueur d'un polynôme, mot de longueur de tr, coefficient
  retourné, polynômes permutés), cohérence des constantes de forme, arbitrage de
  gas avec le seuil de bascule, et contrôle du plancher EIP-7623. La mesure de
  gas soustrait un appelé qui ne fait rien, pour retirer le coût que l'appelant
  paie à construire les 38 Ko d'argument et que la colonne calldata compte déjà.

### Tests
103/103.

## [unreleased] — 2026-10-20 — ML-DSA-65 : clé étendue en quatre blobs, déployable après Glamsterdam

### Measured (`make bench`, via-IR, `optimizer_runs = 1000000`, solc 0.8.30)
| Mesure | avant | après |
|---|---:|---:|
| `verify` (NIST KAT, 33 octets, ctx vide) | 1 536 544 | **1 535 454** |
| runtime size (marge EIP-170) | 24 272 (304) | **24 385 (191)** |
| dépôt d'un blob, aujourd'hui | 2 x ~4 470 000 | **4 x 2 143 998** |
| dépôt d'un blob, après EIP-8037 | 2 x ~31 283 000 | **4 x 14 911 998** |
| plus gros blob (octets) | 20 160 | **9 600** |

Le plafond par transaction d'EIP-7825 (2²⁴ = 16 777 216 gas, actif depuis
Fusaka) et le passage du dépôt de code de 200 à 1 530 gas/octet par EIP-8037
rendaient les deux moitiés de 20 160 octets indéployables : 31,3 M par moitié,
60 M pour la clé entière. Les quatre blobs tiennent à 89 % du plafond. Les
colonnes « avant » du dépôt sont calculées avec le modèle de
`test/dilithium65_deploy.t.sol` ; les colonnes « après » sont mesurées.
ML-DSA-44 et ETH inchangés (1 189 532 / 840 309).

### Changed
- `readPubKeyPacked65(address[4])` remplace `readPubKeyPacked65(address, address)` :
  quatre blobs de neuf polynômes en indices plats (f < 30 → A[f / 5][f % 5],
  f ≥ 30 → t1[f − 30]), `tr` dans le dernier. Les blobs n'ont plus
  d'encadrement ABI : suite brute de polynômes `[32][32 mots]`, parcourue par
  arithmétique, contrôlée par la taille de code exacte et les mots de longueur.
  Voir DECISIONS.md ADR-005.
- `ZKNOX_dilithium65.setKey` écrit quatre contrats au lieu de deux et rend un
  `pk` de 80 octets ; l'argument est la clé entière (38 112 octets).
- `js/mldsa65.js` : `encodePublicKeyBlob65` rend `{ blobs: [4], setKeyData }`,
  `encodeKeyHalf65` et `HALF_BYTES` remplacés par `flattenKeyPolys65`,
  `BLOB_BYTES65`, `LAST_BLOB_BYTES65`, `KEY_BYTES65`.
- `test/KAT/mldsa65_kat0.json` : `half0`/`half1` remplacés par
  `blob0`..`blob3` (régénérer avec `node js/gen_test_vectors65.js 10`).
- `script/DeployDilithium65.s.sol` dépose la clé du KAT blob par blob ;
  `KEY_ONE_SHOT=true` revient à `setKey` sur une chaîne qui tarife encore à 200.

### Added
- `ZKNOX_dilithium65.storeBlob(blob)` : un blob par transaction, le seul chemin
  qui passe après EIP-8037 ; `packKey(address[4])` assemble le `pk`.
- `test/dilithium65_deploy.t.sol` (3 tests) : dépôt blob par blob suivi d'une
  vérification, `setKey` en un coup, tailles refusées, rang du dernier blob, et
  le budget de gas contrôlé contre le plafond EIP-7825 — le test échoue si une
  évolution repasse au-dessus.

### Tests
96/96 (22 sur ML-DSA-65, dont les 15 vecteurs ACVP sigVer et les 10 du
PQCsignKAT_Dilithium3.rsp, plus les 3 nouveaux du dépôt).

## [2026-09-16] — ML-DSA-65 (FIPS 204 category 3): verifier, js signer, NIST KATs

### Measured (`make bench`, via-IR, `optimizer_runs = 1000000`, solc 0.8.30)
| Mesure | ML-DSA-44 | **ML-DSA-65** |
|---|---:|---:|
| `verify` (NIST KAT, 33-byte message, empty ctx) | 1 189 532 | **1 536 544** |
| runtime size (EIP-170 margin) | 24 383 (193) | **24 272 (304)** |
| `setKey` (two SSTORE2 halves of 20 160 bytes) | — | 8 710 129 |
| transforms per verify | 9 | 12 |

1.29x the ML-DSA-44 cost (1 544 360 in `test/dilithium65KATS.t.sol`, key
pointers cold) for 1.88x the matrix (30 polynomials against 16),
12 transforms against 9, the same three hashes (w1 is 768 bytes in both sets:
4 bits x 6 polynomials against 6 bits x 4). ML-DSA-44 and ETH figures and
bytecode unchanged.

### Added
- `src/ZKNOX_dilithium65.sol` — the verifier. Same shape as `ZKNOX_dilithium`:
  helper bound by code hash, `setKey`, `verify(pk, m, sig, ctx)` and the
  `ISigVerifier` `verify(pk, bytes32, sig)`; signature 3309 bytes
  (c~ 48 || z 3200 || h 61), final hash of 48 bytes (lambda = 192) compared by
  keccak. Custom errors (`InvalidSignatureLength`, `ContextTooLong`,
  `BadKeyLength`) instead of the revert strings, calldata parameters (ABI
  unchanged): the EIP-170 room. **The expanded key does not fit in one
  SSTORE2 contract** (36 864 bytes of words, 39 937 with the ABI framing,
  against 24 576; even at 23 bits per coefficient it would be 26 496): the
  key is two halves of the same shape (rows 0..2 / 3..5 of A, t1[0..2] /
  t1[3..5], tr in both, 20 160 bytes each), `setKey(half0 || half1)` writes
  both and `pk` is the two pointers (40 bytes). Found by forge's size check on
  the broadcast of the deployment script, not by the tests (forge does not
  enforce EIP-170 on CREATE in tests). +1.4 k on the verify (second
  `extcodecopy` and header).
- `src/ZKNOX_dilithium65_core_packed.sol` — the parameter-specific kernels on
  the packed layout of `ZKNOX_dilithium_core_packed.sol`:
  - `unpackZPacked65`: 20-bit fields (gamma1 = 2^19), one 10-byte group per
    packed word, two groups per 20-byte read reversed once; lanes split by two
    multiplies (masks of fields {0, 2} and {1, 3}, multipliers 1 + 2^88 and
    2^44 + 2^132); strict bound f in [197, 1 048 379], i.e.
    ||z||inf < gamma1 - beta = 524 092; z = q + gamma1 - f then canonicalised.
    Checked in Python for every 20-bit field.
  - `_matvecRowPacked65`: five columns, one pass, thirteen pointers. Lane
    bound with 5 columns: 80 q^2 + q 2^28 < 7.87e15 < q 2^30, the offset the
    inverse transform's folded reduction applies (the lazy forward lanes are
    < 16q: A/B passes +2q per layer, C +2q then +2q); asserted on the saturated
    input (every lane 16q - 1, every field q - 1). No shape checks in the row
    function (EIP-170 room): the reader validates every polynomial of the
    blobs, `unpackZPacked65` allocates the 5 x 64 words.
  - `_parseHintBytes65`: 61 bytes, omega = 55, six masks (Alg. 21).
  - `useHintPacked65`: gamma2 = (q-1)/32, m = 16, so
    a1 = ((((r + 127) >> 7) 1025 + 2^21) >> 22) & 15 (the & 15 folds 16 -> 0),
    four 4-bit values per word (two bytes), 6 x 128 bytes. The hinted lanes
    (<= 55 of 1 536) are adjusted one at a time as scalars: D = r + 2 gamma2 -
    a1 2 gamma2, a0 > 0 <=> 2 gamma2 < D <= 2 gamma2 + (q-1)/2, +1 or +15 mod
    16; the lane-parallel branch of ML-DSA-44 (nine 32-byte constants) cost
    ~280 bytes of code for a path taken on 55 words. Formulation checked
    exhaustively in Python against Alg. 36 / 40 for every r in [0, q) and both
    hint values.
  - `readPubKeyPacked65(pointer0, pointer1)`: the two halves in one loop body,
    polynomials pointed into the blobs as before.
- `src/ZKNOX_shake_fast.sol`: `sampleInBallFastTau(cTilde, tau, helper)`,
  SampleInBall for any tau <= 64 on the batched sponge (tau = 49, 48-byte c~,
  8 + ~56 bytes of the first block; fallback at ~2^-30). `sampleInBallFast`
  untouched (the ML-DSA-44 bytecode does not move).
- `src/ZKNOX_dilithium65_core.sol` — scalar references (unpackH65, unpackZ65,
  Decompose/UseHint/w1Encode for gamma2 = (q-1)/32, scalar second stage),
  tests only. `src/ZKNOX_dilithium65_utils.sol` — the parameter set.
- **js signer** (no python): `js/mldsa65.js` on `@noble/post-quantum`
  (`ml_dsa65`), `js/ntt_mldsa.js` (FIPS 204 Alg. 41/42, validated by
  reproducing the ML-DSA-44 KAT's on-chain t1 words), `js/sign65.js` (CLI),
  `js/kat_rsp.js`, `js/test_mldsa65.js`, `js/gen_test_vectors65.js`.
  `node js/test_mldsa65.js` replays every NIST vector: ACVP keyGen 25/25,
  sigGen external/pure 30/30 (deterministic and hedged with NIST's rnd),
  sigVer external/pure 15/15, the 100 signatures of the .rsp.
- **KATs, as given by NIST** (`test/KAT/`): `PQCsignKAT_Dilithium3.rsp`
  (reference implementation pq-crystals/dilithium d35ba3f, `PQCgenKAT_sign`
  with the NIST AES-256-CTR DRBG, the file the ML-DSA-44 KAT of
  `test/dilithiumKATS.t.sol` came from — count 0 of `PQCsignKAT_Dilithium2.rsp`,
  checked byte for byte) and the ML-DSA-65 groups of the ACVP
  `ML-DSA-{keyGen,sigGen,sigVer}-FIPS204/internalProjection.json`
  (usnistgov/ACVP-Server 975de31). `test/dilithium65KATS.t.sol` is count 0
  in the literal form of the ML-DSA-44 test (generated); `test/KAT/
  mldsa65_vectors.json` holds the 15 ACVP sigVer vectors (contexts 0..255
  bytes, messages up to 8 KB, 12 corruptions: z, hints, commitment, message),
  counts 0..9 of the .rsp and three js-signer vectors, each with its on-chain
  key; `test/dilithium65_vectors.t.sol` runs them (28/28 NIST verdicts) and
  the bytes32 interface.
- `test/dilithium65_core_packed.t.sol` (18): z decode against the scalar form
  on the KAT, random bytes, random in-norm fields, the four boundary values
  196 / 197 / 1 048 379 / 1 048 380 in every lane, a sweep of 3 840 field
  values; hint parser on the KAT, six corruptions, random valid encodings of
  every weight; matvec row fuzz against the scalar path with the lane bound
  and through the inverse transform, saturated worst case; useHint fuzz at
  eight hint densities, 24 boundary values of Decompose in every lane, the a1
  steps against a FIPS transcription; SampleInBall tau = 49 on the KAT and
  fuzzed 48-byte inputs against `sampleInBallNist`; full second stage packed
  against scalar on the KAT; key halves of ten wrong shapes rejected.
- `script/DeployDilithium65.s.sol`, `script/deploy_dilithium65.sh`: deploys
  the verifier bound to `F1600_HELPER` and verifies the NIST KAT on it (the
  key through `setKey`). Run against anvil: 5 253 391 gas for the verifier,
  8 710 129 for the key, KAT true.
- `test/benchmarks.t.sol`: `testMLDSA65` (KAT key and signature from
  `test/KAT/mldsa65_kat0.json`, no python). `foundry.toml`: read permission
  on `test/KAT`. `makefile`: `gen_test_vectors65`, `test_signer65`,
  `test_verifier65`.

### Tried and discarded, measured
- Lane masks of the matvec in Yul variables (`let m0 := _LN0`, DUP instead of
  PUSH32): identical size, +1.4 k gas — via-IR rematerialises the literals
  (as noted for `_M32` on 2026-09-05).
- z decode as a two-iteration inner loop over the groups of a pair: −273
  bytes but +34 k gas (stack layout of the nested loop); as a flat loop over
  the 320 groups with a 16-byte reversal (four stages, PUSH16 masks): −459
  bytes, +21 k. Kept the unrolled pair (0 gas) and took the room from the
  hint branch, the matvec shape checks and the revert strings instead.
- Single-blob key: 39 937 bytes, refused by the broadcast (see above).

### Tests
`forge test`: 108/115 in both profiles; the 7 failures are the pre-existing
python-signer FFI tests (`pythonref/` absent from this checkout).

## [unreleased] — 2026-09-09 — retours des sessions Falcon : tables copiées une fois, pointeurs courants

### Measured (`make bench`, via-IR, `optimizer_runs = 1000000`)
| Mesure | Avant | **Après** |
|---|---:|---:|
| `ZKNOX_dilithium.verify` (NIST) | 1 196 707 | **1 189 532** |
| `ZKNOX_ethdilithium.verify` (ETH) | 847 709 | **840 309** |

6,81x et 5,75x depuis l'origine. Tailles : 24 383 (marge EIP-170 **193**) et
20 278. 70/70 tests, profils default et lite.

### Changed (générateur `pythonref/ntt_mont/gen_ntt_mont.py`)
- Les tables de twiddles (aller puis inverse, 32 mots chacune) sont un seul
  `bytes constant`, copié depuis le code une fois par vérification
  (`_tablesMont()`), et les transformées prennent le pointeur
  (`nttFwMontPackedFusedTb`, `nttInvMontPackedRawFusedTb`). Avant, chacune
  des neuf transformées reconstruisait sa table de 32 mots à l'entrée. Les
  entrées autonomes restent pour les tests.
- Les passes intra-mot avancent leurs pointeurs de twiddles avec l'octet
  (32 et 64 octets) au lieu de recalculer `shl(5, i8)` / `shl(6, i8)` : plus
  aucune adresse dérivée d'un compteur dans les transformées, la règle du
  premier code d'ETHFALCON.

### Ce qui ne transfère pas de Falcon
- Huit lanes de 32 bits : q = 23 bits, un produit lane × twiddle fait 46
  bits, quatre lanes de 64 bits sont le maximum.
- Lanes SHAKE résidentes : les trois hashs du NIST passent déjà par l'entrée
  groupée du helper (une permutation résidente à l'intérieur d'un seul
  appel) ; seuls le repli de SampleInBall (2⁻⁴⁰) et la longueur 800 appellent
  la permutation seule.
- Norme repliée dans le sampler, lots de quatre candidats : pas de
  hash-to-point dans ML-DSA.
- Noyau fusionné transformées intra-mot + produit + inverse intra-mot par mot
  : ~−8 k estimés, mais neuf corps intra-mot dans une fonction dépassent
  EIP-170 (marge 193 octets), et une version bouclée demande de garder les
  cinq mots transformés sous la main ; non fait.

## [unreleased] — 2026-09-05 (2) — réglages : SampleInBall en Yul, matvec en une passe, hints en un balayage, clé copiée une fois

### Measured (`make bench`, via-IR, `optimizer_runs = 1000000`)
| Mesure | Avant | **Après** | fireblocks |
|---|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST) | 1 244 890 | **1 196 707** | 1 224 368 |
| `ZKNOX_ethdilithium.verify` (ETH) | 892 644 | **847 709** | — |

6,77x et 5,70x depuis l'origine ; le NIST passe sous le chiffre de fireblocks
(−27 661), l'ETH 31 % en dessous. Tailles : 24 430 (marge EIP-170 **146**,
à surveiller à chaque changement) et 20 325. `ZKNOX_Dilithium_internal`
(test/dilithium_internal.sol, déployé par `DeployDilithiumInternal.s.sol`)
n'expose plus `verifyInternal` : son décodeur ABI de `PubKey` le mettait
684 octets au-dessus d'EIP-170 ; le script de déploiement passe la clé par un
blob SSTORE2 et le `verify` public. `forge build --sizes` sort à 0.

### Changed
- `sampleInBallFast` : la boucle de tirage en Yul sur le bloc pressé (bornes et
  compteurs sans checks) ; l'éponge incrémentale n'est reconstruite que si le
  bloc de 136 octets est épuisé (≈ 2⁻⁴⁰), par un repli Solidity. 66 k → 61 k.
- `_matvecRowPacked` : une seule passe par ligne, les quatre produits de chaque
  lane et le terme c·t1 accumulés en une expression, chaque mot de z chargé une
  fois par ligne et chaque mot d'accumulateur écrit une fois (onze pointeurs,
  le pipeline IR les tient). 59 k → 54,5 k par ligne.
- `_parseHintBytes` : validation de l'encodage, poids et masques en un seul
  balayage des 84 octets ; `dilithiumCore1Packed` rend les masques, que
  `dilithiumCore2Packed` prend en paramètre (plus de `hBytes` relu).
  `_checkHintBytes` / `_hintMasksFromBytes` restent comme façades pour les
  tests. −5 k.
- `readPubKeyPacked` : un seul `extcodecopy` du blob (SSTORE2.read le copiait
  deux fois). −5 k.
- `useHintPacked` : pointeurs courants (mot et sortie), masque de hints
  consommé 4 bits par mot au lieu d'un décalage indexé, et les trois octets de
  chaque mot écrits par un seul `mstore` en tête de mot (les 29 octets nuls
  qui suivent sont réécrits par les mots suivants, le tampon a 32 octets de
  réserve). −5 k.

- `unpackZPacked`, repris depuis l'assembleur produit (`forge inspect
  ZKNOX_dilithium asm`) : le corps de groupe compilé faisait 104 opcodes,
  dont 42 pour l'inversion des 9 octets, sans gras de codegen ; seule
  l'amortir aidait. Deux groupes par chargement de 18 octets (32 paires par
  polynôme, aucune frontière à franchir), une inversion de 32 octets en cinq
  étages, deux corps de groupe inlinés, pointeurs courants. 92,6 k → ~73 k,
  sous les 77 k de fireblocks. −20 k sur le verify.

### Essayé puis écarté, mesuré
- Stores des hints groupés par huit mots (boucle interne, décalages
  variables) : +6 k.
- Décodage de z par trois groupes par chargement avec corps de groupe en
  fonction Yul et destination calculée depuis l'index (les triplets
  franchissent les frontières de polynômes) : +4 k et +1,1 Ko de runtime.
  La version à deux groupes ci-dessus est ce qui en reste.

### Ce qui reste
Par étage (via-IR, contrat déployé) : clé ~10 k, décodage ~73 k
(fireblocks 77 k), hints ~78 k (72 k), SampleInBall 61,5 k (60 k), NTT ×5
201 k (225 k), matvec ×4 218 k (221 k), INTT ×4 181 k (214 k), hashs 339 k
(340 k). Plus aucun poste nettement au-dessus ; les hints à 6 k, le reste
devant. Le plancher de la variante NIST reste les 9 permutations (375 k,
31 %).

### Tests
`forge test` : 70/70, profils default et lite.

## [unreleased] — 2026-09-05 — profil de compilation : via-IR, `optimizer_runs = 1000000`

### Measured (`make bench`, profil par défaut du dépôt)
| Mesure | legacy, runs 10000 (avant) | **via-IR, runs 1e6 (après)** | fireblocks |
|---|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST) | 1 358 953 | **1 244 890** | 1 224 368 |
| `ZKNOX_ethdilithium.verify` (ETH) | 1 001 185 | **892 644** | — |
| nttFwMont / nttInvMont | 59 345 / 61 609 | 48 152 / 50 881 | 44 931 / 53 591 |

6,50x et 5,41x depuis l'origine. Tailles : 23 889 (marge EIP-170 687) et 20 116.

### La cause, trouvée (voir DECISIONS.md, ADR-004)
Sous via-IR, les transformées coûtaient 49 k et 59 k dans le vérifieur contre
40 k et 45 k isolées. L'assembleur EVM de la même passe compilée dans le
vérifieur contenait 33 `mload` / 14 `mstore` contre 8 / 2 dans un petit
contrat : l'optimiseur de constantes de solc matérialisait le masque de lane
`_M32` par `codecopy` depuis la section de données à chacune de ses 102
occurrences (via-IR rematérialise la variable `m32` en littéral, puis
`ConstantOptimiser` arbitre PUSH32 contre CODECOPY avec un modèle où le coût
de déploiement de 102 × 33 octets l'emporte sur `runs` × 3 gas dès que `runs`
est petit). Chaque usage coûtait ~25 gas au lieu de 3, ≈ +95 k par
vérification. `optimizer_runs = 1000000` rétablit PUSH32 ; le profil par
défaut passe en via-IR, où les noyaux packés sont ~20 % moins chers (le
profil `lite` l'était déjà).

### Changed
- `foundry.toml` : `via_ir = true`, `optimizer_runs = 1000000`, commenté. Le
  bytecode déployé des deux vérifieurs change.
- Chaînes de revert des noyaux packés et de la glue d'éponge remplacées par
  des erreurs (`BadPubKeyBlob`, `BadLength`, `HelperCallFailed`,
  `BatchUnsupported`) : −600 octets, nécessaires sous EIP-170 en via-IR.
  Les messages des `verify` publics (« invalid signature length »…) sont
  inchangés.
- `nttFwMontPackedFused` / `nttInvMontPackedRawFused` : les trois passes en
  un bloc d'assembleur (générés), branchés dans le core. Neutres en gas, gardés
  parce que c'est l'expérience qui a isolé la cause ci-dessus.

### Essayé puis écarté, mesuré
- Lecture de la clé en flux (EXTCODECOPY ligne par ligne, pic mémoire −11 Ko) :
  +600 gas. Le coût de la lecture n'est pas dans la copie.
- Sortie de la NTT aller en lanes séparées pour une matvec sans masque :
  +26 k. Charger une lane (`mload` + adressage, 9 gas) coûte plus que la
  masquer (`and` + PUSH32, 6 gas), et les 40 Ko de mémoire en plus paient
  leur expansion. Le layout packé reste le bon pour la matvec.
- Passes sans `memory-safe`, variable Yul sans `_M32` : identiques.

### Tests
`forge test` : 71/71, profils default et lite.

## [unreleased] — 2026-09-04 (4) — hashs par appel groupé du helper, décodage de z resserré

### Measured (`make bench`, legacy, solc 0.8.30)
| Mesure | Avant | Après | via-IR |
|---|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST) | 1 391 146 | **1 358 953** | 1 341 093 |
| `ZKNOX_ethdilithium.verify` (ETH) | 1 016 141 | **1 001 185** | 894 848 |

fireblocks-labs/evm-ml-dsa-verifier (NIST, via-IR) : 1 224 368. En ETH on est
27 % en dessous d'eux sous via-IR ; en NIST 10 % au-dessus.

### Changed
- `shake256Batch` (repris de leur `shake256Batch170`, MIT) : le helper a une
  seconde entrée, dispatchée sur calldatasize ≠ 800, qui exécute toute
  l'éponge (padding, absorb, permutations, premier bloc pressé) en UN
  staticcall. μ (98 octets) et le hash final (832 octets, 7 permutations)
  passent par là via `shake256Any`, qui retombe sur l'éponge bloc par bloc
  pour la longueur 800 exactement (possible pour certains messages : tr ‖ m'
  de 800 octets). Testé sur toutes les longueurs 0..1099 par pas de 37 et
  800 en fuzz contre `shakeUpdate`/`shakeDigest`. −14 k sur le hash final.
  `sampleInBallFast` prend son premier bloc par cet appel ; l'éponge
  incrémentale n'est reconstruite que si le bloc est épuisé (≈ 2⁻⁴⁰).
- `unpackZPacked` : la valeur little-endian du groupe de 9 octets vient
  d'une inversion d'octets par échelle de masques (16 octets, 4 étages) au
  lieu de 9 `byte()` et 8 décalages ; les quatre champs vont aux lanes par
  deux multiplications (champs pairs × (1 + 2⁹²), impairs × (2⁴⁶ + 2¹³⁸),
  les copies parasites tombent au-dessus du bit 17 de chaque lane et sont
  masquées) ; un seul bloc d'assembleur pour les quatre polynômes.
  112 k → 92 k (via-IR). Le reste est le compte d'opcodes : ~110 par groupe,
  masques de 32 octets compris.

### Où est l'écart restant avec fireblocks (NIST, via-IR, par étage)
clé 15 k / 5 k ; décodage + hints 97 k / 85 k ; SampleInBall 66 k / 60 k ;
NTT ×5 200 k / 225 k et INTT ×4 181 k / 214 k mesurés isolément (nos noyaux
sont devant) mais 244 k / 234 k dans le vérifieur ; matvec 236 k / 221 k ;
hints 83 k / 72 k ; hash final 292 k / 292 k. Le poste principal est celui
des transformées dans le vérifieur : +90 k par rapport à leur coût isolé,
sous via-IR seulement, dû à la compilation de `verifyInternal` (une grande
fonction, beaucoup de pointeurs vivants) et pas à l'arithmétique. Non
résolu.

### Tests
`forge test` : 71/71, profils default et lite.

## [unreleased] — 2026-09-04 (3) — SHAKE sur helper externe, décodage de z en SWAR, clé lue sans copie

### Measured (`make bench`, legacy, solc 0.8.30)
| Mesure | Avant | Après | Origine |
|---|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST ML-DSA-44, KAT) | 4 920 733 | **1 391 146** | 8 094 831 |
| `ZKNOX_ethdilithium.verify` (MLDSAETH, KAT) | 2 075 464 | **1 016 141** | 4 827 994 |
| `nttFwMont` / `nttInvMont` | 70 471 / 74 591 | 59 345 / 61 609 | 195 602 / 211 483 |

5,82x et 4,75x depuis l'origine. Sous via-IR : 1 380 011 / 1 001 348 (un
`via_ir = true` dans le profil default, comme le profil lite ; non appliqué,
décision de configuration du dépôt). fireblocks-labs/evm-ml-dsa-verifier,
mesuré ici avec leur profil : 1 224 368.

Profil NIST (contrat déployé, via-IR, avant les deux derniers gains) : clé
74 k → ~10 k ; core1 packé (validation des hints, z décodé + borne) 123 k ;
SampleInBall 64 k ; NTT ×5 247 k ; matvec ×4 238 k ; INTT ×4 235 k ;
hints + w1 119 k → ~90 k ; μ 47 k ; hash final 307 k.

### Added
- `src/ZKNOX_shake_fast.sol` — SHAKE256 sur le helper Keccak-f[1600] externe
  (`test/f1600_170.hex`, 21 622 octets, fireblocks-labs/evm-ml-dsa-verifier
  cca262b, tel que dans ZKNoxHQ/ETHFALCON), glue d'éponge reprise verbatim
  (MIT, en-tête) ; `sampleInBallFast` : SampleInBall sur cette éponge, sortie
  PACKÉE, même flux d'octets que `sampleInBallNist` (8 octets de signes puis
  un octet par tirage, rejet si > i), second bloc pressé seulement si le
  premier est épuisé. Fuzz contre `sampleInBallNist` et contre
  `shakeUpdate`/`shakeDigest` (longueurs 0..299, 98 → 64, 832 → 32).
  SampleInBall 790 k → 64 k, μ 407 k → 45 k, hash final 1 880 k → 304 k.
- `ZKNOX_dilithium` : `constructor(address helper)`, liaison par
  EXTCODEHASH (`F1600_CODEHASH`), revérifiée dans les deux `verify`
  (`BadHelper()`), `f1600Helper` immutable. `script/DeployF1600Helper.s.sol`
  déploie le helper (une fois par chaîne, --ffi), `deploy_dilithium_internal.sh`
  exige `F1600_HELPER`, `DeployDilithiumInternal.s.sol` le lit dans
  l'environnement, `test/F1600Helper.sol` le déploie dans les tests. La
  version ETH (Keccak natif) n'est pas concernée.
- `unpackZPacked(zBytes)` (core packé) — les 2 304 octets de z décodés
  directement en 4 polynômes packés canoniques, avec la borne
  ‖z‖∞ < γ₁ − β sur quatre lanes à la fois : un groupe de 9 octets (quatre
  champs de 18 bits, bit-packing little-endian) lu en un mot, réassemblé en
  little-endian, éclaté en lanes, canonicalisé (z = q + γ₁ − f, moins q si
  ≥ q) et borné (f ∈ [79, 262065]) par bits de test. Fuzz sur octets
  aléatoires et valeurs frontières 78/79/262065/262066 dans chaque lane
  contre `unpackZ` et la borne FIPS 204. `_checkHintBytes` : validation de
  l'encodage des hints (Alg. 21) sans matérialiser les tableaux, poids
  retourné. `dilithiumCore1Packed(sig)` remplace `dilithiumCore1` et la
  boucle de norme du vérifieur. core1 826 k → ~120 k.
- `readPubKeyPacked(pointer)` — lecture sans copie du blob SSTORE2 : chaque
  polynôme y est encodé `[32][32 mots]`, exactement le format mémoire d'un
  `uint256[]` de longueur 32, donc `PubKey` pointe dans le blob (20 stores de
  pointeurs au lieu d'un `abi.decode` de 640 mots à travers des tableaux
  dynamiques imbriqués). Offsets et longueurs vérifiés en lisant (forme fixe
  4×4×32, 4×32, tr de 64 octets), blob d'une autre forme ou tronqué → revert
  « bad pk blob » (testé). 82 k → ~10 k. Le format du blob ne change pas.
- `nttFwMontPackedInPlace` (passe A sur tableau packé), `packPoly`.
- `test/shake_fast.t.sol` (5), `test/dilithium_core_packed.t.sol` (+5 :
  lecture de clé, z réel et fuzz et frontières, hints valides et corrompus).

### Changed
- Masque de lane `_M32` chargé une fois par passe dans une variable Yul
  (générateur, `RED` lit `m32`) au lieu de deux PUSH32 par réduction :
  −768 octets de runtime par passe radix-8 et, sous le codegen legacy,
  −11 k / −13 k par transformée (59 345 / 61 609). `ZKNOX_dilithium` passe
  de 27 411 octets (au-dessus d'EIP-170, que forge n'impose pas en test) à
  23 392 (marge 1 184) ; `ZKNOX_ethdilithium` 20 418. Les biais en variables
  locales font déborder la pile (legacy), écarté.
- `useHintPacked` : le test de signe et l'ajustement ne tournent que sur les
  mots dont un coefficient porte un hint (≤ 80 sur 1 024) : −30 k.
- Borne de norme : l'ancienne boucle du vérifieur rejetait ‖z‖∞ > γ₁ − β,
  la version packée applique FIPS 204 (rejet si ≥). Un signeur conforme
  n'émet jamais |zᵢ| = γ₁ − β ; les KATs sont inchangés.
- `sampleInBallKeccakPrng` (ETH) est empaqueté par `packPoly` ; `_fwPassA`
  (entrée étendue) n'est plus utilisée par les vérifieurs.

### Not done
- via-IR par défaut : −11 k / −15 k et 4 k de marge EIP-170 en plus ;
  changement de profil de compilation, à décider.
- Le reste de l'écart avec fireblocks sur le NIST (≈ 170 k) : leurs
  transformées sous via-IR (45 k / 54 k contre nos 59 k / 62 k en legacy),
  hints (72 k contre ~90 k), glue.

### Tests
`forge test` : 68/68, profils default et lite.

## [unreleased] — 2026-09-04 (2) — second étage en layout packé : matvec, INTT à réduction repliée, hints, w1

### Measured (`make bench`, legacy, solc 0.8.30)
| Mesure | Avant (NTT Montgomery seule) | Après | Origine |
|---|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST ML-DSA-44, KAT) | 6 987 680 | **4 920 733** | 8 094 831 |
| `ZKNOX_ethdilithium.verify` (MLDSAETH, KAT) | 3 683 689 | **2 075 464** | 4 827 994 |

−2,07 M sur le NIST (−29,6 %), −1,61 M sur l'ETH (−43,7 %) ; 1,64x et 2,33x
depuis l'origine.

Profil du NIST après (contrat déployé, legacy) : lecture + décodage de la clé
82 k ; core1 (unpackH, normH, unpackZ) 826 k ; SampleInBall SHAKE 790 k ;
NTT packée ×5 346 k ; matvec packée 4 lignes avec c·t1 245 k (était
expandMat 826 k + expandVec 193 k + matvec 679 k + vecSubMulMod 240 k =
1 938 k) ; INTT packée à réduction repliée ×4 276 k ; useHint + w1 packés
~130 k (était 309 k) ; SHAKE μ 407 k ; SHAKE final 1 880 k.

### Added
- `src/ZKNOX_dilithium_core_packed.sol` — `dilithiumCore2Packed(pk, z, c,
  hBytes)`, même sortie (768 octets de w1) que
  `dilithiumCore2(pk, z, nttFw(c), unpackH(hBytes), expandVec(pk.t1))`,
  assertée sur une vraie signature.
  - `_matvecRowPacked` : acc = Σ_j A_ij ∘ ẑ_j + q·2²⁸ − ĉ ∘ t1_i sur les mots
    packés, la clé consommée dans sa forme stockée (32 mots de huit champs de
    32 bits par polynôme, un mot compact couvre deux mots packés) : plus
    d'`expandMat`, plus d'`expandVec`. Produit de lane = `mul(and(z, lane_k),
    champ_k)`, < 2⁵¹, local ; quatre produits + le biais − un produit c·t1
    restent < 7,03e15 < q·2³⁰. Deux passes sur l'accumulateur (lignes 0-1
    puis 2-3 et c·t1), le codegen legacy n'ayant pas la place pour dix
    pointeurs.
  - `useHintPacked(masks, w)` : Decompose / UseHint / w1Encode lane par lane
    (a1 = ((r+127)>>7)·11275 + 2²³ >> 24 puis 44→0, D = r + 2γ₂ − a1·2γ₂,
    a0 > 0 ⟺ 2γ₂ < D ≤ 2γ₂ + (q−1)/2, ajustement ±1 mod 44 par masques de
    lane, quatre valeurs de 6 bits rassemblées en 24 bits). Formulation
    vérifiée exhaustivement en Python (numpy) contre l'arithmétique de
    `useHintDilithium` pour tout r ∈ [0, q) et les deux valeurs de hint.
  - `_hintMasksFromBytes` : les quatre masques de hints directement depuis
    l'encodage de 84 octets (≤ 80 bits à poser), à la place d'un parcours des
    1 024 coefficients décodés (95 k mesurés pour ce parcours seul).
    `_hintMasks(h)` conservé comme forme de référence pour les tests.
- `nttFwMontPacked(a)` : NTT aller depuis le tableau étendu, sortie PACKÉE et
  LAZY (< 17q) ; `nttInvMontPackedRaw(A)` : NTT inverse en place sur le
  tableau packé dont les lanes sont les valeurs brutes de l'accumulateur
  (< q·2³⁰), réduction repliée dans la première passe scalaire (offset q·2³⁰
  sur les différences, `addmod` sur les sommes), sortie canonique packée.
  Générateur étendu (`fw_inword(k, lazy="packed")`, `inv_inword(k, raw=True)`).
- `test/dilithium_core_packed.t.sol` (5) — vraie clé et vraie signature :
  w1 identique au scalaire et masques depuis les octets égaux aux masques
  depuis les tableaux ; fuzz d'une ligne de matvec contre le calcul scalaire
  (257 tirages, borne de lane < q·2³⁰ assertée) puis à travers l'inverse ;
  fuzz useHint contre `useHintDilithium` (257 tirages, densités de hints
  variées) ; valeurs frontières de Decompose sur toutes les positions de
  lane et les deux valeurs de hint ; masques.

### Changed
- `src/ZKNOX_dilithium.sol`, `src/ZKNOX_ethdilithium.sol` : le second étage
  est `dilithiumCore2Packed(pk, z, cNtt, signature.h)` ; `nttFw(cNtt)` et
  `expandVec(pk.t1)` disparaissent des vérifieurs. `dilithiumCore2`,
  `expandMat`, `expandVec`, `matVecProductDilithium`, `vecSubMulMod`,
  `useHintDilithium` restent dans l'arbre comme références des tests.
- `README.md` : table des benchmarks.

### Not done
- `unpackZ` (dans les 826 k de core1) est maintenant le premier poste
  scalaire : 1 024 coefficients de 18 bits, `bitUnpackAtOffset` puis boucle
  checkée. Fireblocks fait le décodage et la borne en SWAR à 86 k ; même
  recette, sortie directement packée (ce qui supprimerait aussi le packing à
  la volée de `_fwPassA`).
- SHAKE en Solidity : 3,08 M sur le NIST (SampleInBall 790 k, μ 407 k, hash
  final 1 880 k). Le helper Keccak-f externe d'ETHFALCON (41,7 k par
  permutation) ramènerait ce poste vers 400 k ; c'est la version ETH qui n'en
  a pas besoin.

### Tests
`forge test` : 58/58 (39 existants + 10 NTT + 5 core packé + 4 bench), profils
default et lite.

## [unreleased] — 2026-09-04 — NTT packée 4×64 avec réduction de Montgomery

### Measured (`make bench`, forge nightly c808c4cd, solc 0.8.30, evm osaka, optimizer 10000, legacy codegen)
| Mesure | Avant | Après | Δ |
|---|---:|---:|---:|
| `ZKNOX_dilithium.verify` (NIST ML-DSA-44, KAT) | 8 094 831 | **6 987 680** | −13,7 % |
| `ZKNOX_ethdilithium.verify` (MLDSAETH, KAT) | 4 827 994 | **3 683 689** | −23,7 % |
| `nttFw` → `nttFwMont` | 195 602 | 70 471 | 2,78x |
| `nttInv` → `nttInvMont` | 211 483 | 74 591 | 2,84x |

Neuf transformées par vérification (NTT(z) ×4, NTT(c), INTT ×4) : −1,1 M.
Sous via-IR + optimizer, les noyaux tombent à 48 k / 51 k mais le reste du
vérifieur ne gagne rien (6 993 067 / 3 603 427) : le profil par défaut reste
legacy.

### Added
- `src/ZKNOX_NTT_dilithium_mont.sol` (GÉNÉRÉ par `pythonref/ntt_mont/gen_ntt_mont.py`,
  puis `forge fmt`) — `nttFwMont` / `nttInvMont`, remplaçants directs de
  `nttFw` / `nttInv` : même signature, même sémantique en place sur un tableau
  de 256 coefficients canoniques, même résultat. À l'intérieur : 64 mots de
  quatre lanes de 64 bits, trois passes fusionnées par direction (radix-8 sur
  les octets de mots pour t = 128…4, puis t = 2, 1 dans le mot en scalaires
  `mulmod`), lecture depuis le tableau étendu avec packing à la volée, écriture
  étendue et canonique. Les produits twiddle des couches packées sont réduits
  par un pas de Montgomery local à la lane (R = 2³², twiddles de ces couches
  stockés en forme de Montgomery, aucune conversion) :
  `t = ((x mod 2³²)·QINV) mod 2³²`, `r = (x + t·q) >> 32`, r < x/2³² + q < 2q.
  Six ops et trois multiplications pour quatre produits, contre dix ops (quatre
  multiplications) pour le Barrett de lane à deux étapes qu'impose un q de
  23 bits. `shr(32)` sur le mot entier est propre parce que les 32 bits bas de
  chaque lane sont nuls.
- `pythonref/ntt_mont/model_ntt_mont.py` — modèle Python du schedule, validé
  contre un modèle des boucles scalaires de `ZKNOX_NTT_dilithium.sol` (mêmes
  tables `psirev`, lues dans la source), 40 tirages dont les cas saturés,
  vecteur de `test/NTT_dilithium.t.sol` épinglé. Chaque pas asserte ce que le
  Solidity suppose : lanes < 2⁶⁴, (x mod 2³²)·QINV < 2⁶⁴, x + t·q < 2⁶⁴,
  branche soustractive positive, r < 2q.
- `pythonref/ntt_mont/gen_ntt_mont.py` — générateur. Les corps radix-8 (12
  papillons) et les passes intra-mot déroulées ×8 sont répétitifs et tiennent à
  une discipline de pile stricte (codegen legacy, ≤ 16 slots atteignables) :
  une seule source pour les six passes.
- `nttFwMontLazy` (même fichier) — sortie lazy (< 17q, congrue mod q, deux
  `addmod` par coefficient en moins), pour un consommateur qui ne fait que
  du `mulmod` / `addmod` dessus, ce qui est le cas de la matvec et de
  `vecSubMulMod`. Non branchée dans les vérifieurs (−2 k par transformée en
  legacy, contrat « même résultat que nttFw » gardé) ; c'est la variante qui
  compte pour le pipeline packé, voir la comparaison ci-dessous.
- `test/NTT_dilithium_mont.t.sol` (10) — différentiel contre `nttFw` / `nttInv` :
  vecteur du dépôt, 8 vecteurs fixes, 257 tirages de fuzz par direction, cas
  saturé (tous q−1), polynôme nul, impulsions (un coefficient non nul, chaque
  chemin de twiddles), allers-retours croisés (scalaire ↔ packé), sortie
  canonique assertée partout ; variante lazy assertée congrue mod q et < 17q.

### Changed
- `src/ZKNOX_dilithium.sol`, `src/ZKNOX_ethdilithium.sol`,
  `src/ZKNOX_dilithium_core.sol` : import de `nttFwMont` / `nttInvMont` sous
  les noms `nttFw` / `nttInv` (une ligne chacun). `ZKNOX_NTT_dilithium.sol`
  reste la référence des tests.
- `test/benchmarks.t.sol` : quatre entrées `NTTFwScalar`, `NTTFwMont`,
  `NTTInvScalar`, `NTTInvMont`, même entrée pour les quatre.
- `README.md` : table des benchmarks.

### Bornes
- aller : entrées canoniques, +2q par couche packée (r < 2q, biais 2q), < 13q
  avant la passe intra-mot, produits < 13q·q < 2⁵⁰ ; la passe intra-mot est
  scalaire et canonicalise. Des entrées < 2³² donneraient encore le résultat
  de `nttFw` ; l'inverse exige des entrées < q (le vérifieur ne fournit que
  des valeurs canoniques dans les deux cas).
- inverse : lanes canoniques en sortie de la passe intra-mot, sommes jamais
  réduites et doublées par couche (biais q, 2q, 4q puis 8q, 16q, 32q), < 64q
  à la dernière couche (n⁻¹ replié, `psirev_inv[1]·n⁻¹` et n⁻¹ en forme de
  Montgomery en littéraux), produits < 64q·q < 2⁵³, r < q + 2²¹ < 2q,
  canonicalisation par le bit 23 de r + 2²³ − q.

### Note de mesure
Sous le codegen legacy de solc 0.8.30, le coût d'une même fonction libre
varie de ±15 % selon le contrat qui l'inclut (passe B : 19,9 k en ligne dans
un contrat de test forge-std, 14,9 k dans un petit contrat déployé ;
`nttFwMont` : 70 471 dans le contrat de bench, 59 075 dans un contrat qui ne
fait que l'appeler). Le bytecode des fonctions est le même, c'est le contexte
qui compile différemment. Les chiffres de ce fichier viennent de `make bench`
(vérifieurs déployés, chiffres stables), et les comparaisons entre variantes
sont faites sous via-IR, stable au gas près.

### Comparaison avec fireblocks-labs/evm-ml-dsa-verifier (cca262b), via-IR, packé → packé
Leurs noyaux, mesurés ici avec leur `PROFILE_E2E` : `nttFwV3` 44 931 (sortie
lazy), `nttInvV3` 53 591 (réduction de l'accumulateur matvec repliée dans la
première passe). Les nôtres, variante packé → packé dans un contrat déployé
sous via-IR : aller lazy **40 059** (A 8 771, B 11 552, C 19 037, table 699),
inverse **45 425** (C' 21 261, B' 10 925, A' 12 537, table 702). Les passes
radix-8 Montgomery sont les moins chères des deux côtés ; les passes intra-mot
sont scalaires `mulmod` chez eux comme chez nous.

### Montgomery contre Barrett à deux étapes, mesuré
Même passe radix-8 (96 papillons-mots), même entrée, contrat déployé, legacy :
passe B aller 14 868 contre 16 788, passe B' inverse 14 740 contre 16 660.
20 gas par papillon-mot, ≈ 3,8 k par transformée, ≈ 35 k par vérification.

### Essayé puis écarté
- SWAR lazy pour les couches intra-mot (t = 2 sur les demi-mots, t = 1 sur
  les lanes 0,2 contre 1,3, deux REDC par mot), aller et inverse, variante
  packée validée contre le scalaire puis mesurée : aller 53 563 contre 50 521
  (via-IR) et 69 014 contre 64 430 (legacy), inverse 62 470 contre 58 361 et
  77 654 contre 68 579. Deux REDC par mot coûtent plus que quatre `mulmod`
  sur des scalaires déjà extraits. Écarté.
- via-IR pour le dépôt : −20 k par transformée, +0 sur le vérifieur.

### Not done
- Le reste du vérifieur reste en un-coefficient-par-mot : matvec, décodage de
  z, hints, expansion de la matrice, SHAKE en Solidity. C'est là que sont les
  5,9 M restants du NIST et les 3,0 M de la version ETH ; la recette packée
  (layout 4×64 partout, clé en champs de 32 bits lue par EXTCODECOPY, décodage
  direct dans le layout) est celle de fireblocks-labs/evm-ml-dsa-verifier
  (1,22 M mesuré) et s'applique ici pièce par pièce.

### Tests
`forge test` : 53/53 (39 existants + 10 différentiels + 4 entrées de bench), profils default et lite.
