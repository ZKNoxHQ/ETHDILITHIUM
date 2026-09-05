# VERSION.md — changelog

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
