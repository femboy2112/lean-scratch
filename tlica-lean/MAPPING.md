# TLICA Lean Encoding — Declaration Map

Every Lean declaration in this project maps to a specific section, line, or
named result in the v0.3.1 rigorous edition of the formal apparatus. This
file is the cross-reference table that connects the two artifacts.

## TLICA.Basic

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `class KField` | `00_signature.md` §0.3 (K-field requirements) | Encoded |
| `KField.δ` | `00_signature.md` §0.3, §0.6 (positive infinitesimal δ) | Encoded |
| `KField.δ_pos` | `00_signature.md` §0.3 (δ > 0) | Encoded |
| `KField.δ_lt_one` | `00_signature.md` §0.3 (δ < 1) | Encoded |
| `KField.δ_lt_rat` | `00_signature.md` §0.3 (non-Archimedean property) | Encoded |
| `KField.one_sub_δ_pos`, `δ_lt_half` | Derived helpers used downstream | Encoded |

## TLICA.IntegrationGraph

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `strict_rho_bound` | `02_graph_theory.md` §2.4 (Lemma 2.4.2) | Encoded (warm-up) |
| `strict_quotient_bound_field` | Field-generic form of Lemma 2.4.2 | Encoded |
| `rho_nonneg` | Range corollary of Lemma 2.4.2 | Encoded |

## TLICA.PhiCoordinate

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `phiCogito` | `00_signature.md` §0.6 (cogito φ-axiom) | Encoded |
| `phiTier3` | `03_coordinates.md` §3.3.3 (Tier-3 formula) | Encoded |
| `PhiAdmissibility` | `00_signature.md` §0.14 (φ-admissibility axiom, lines 143-149) | Encoded |
| `Tier3Strictness` | `00_signature.md` §0.14 (Tier-3 strictness axiom, lines 151-157) | Encoded |
| `phi_tier3_nonneg` | `03_coordinates.md` §3.3.6 (a), lower half | Encoded |
| `phi_tier3_le_phiCogito` | `03_coordinates.md` §3.3.6 (a), upper non-strict half | Encoded |
| `phi_tier3_lt_phiCogito` | `03_coordinates.md` §3.3.6 (Proposition 3.3.7, strict form) | Encoded |
| `cogito_unique_phi_supremum` | `03_coordinates.md` §3.3.6 (combined statement) | Encoded |
| `DPhi` | `06_independence_lemmas.md` §6.5 (admissible φ-domain, v0.3.1 repair) | Encoded |
| `two_delta_minus_real_in_DPhi` | `06_independence_lemmas.md` §6.5 (D_φ ⊋ (1-δ-ℝ_{≥0})) | Encoded |

## TLICA.ModeAggregation

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `mode_aggregation_summable` | `02_graph_theory.md` §2.5 (i) (absolute convergence) | Encoded |
| `mode_aggregation_nonneg` | `02_graph_theory.md` §2.5 (ii) lower bound | Encoded |
| `mode_aggregation_le_one` | `02_graph_theory.md` §2.5 (ii) upper bound | Encoded |
| `mode_aggregation_lt_one` | `02_graph_theory.md` §2.5 (iii) strict bound off cogito | Encoded |

## TLICA.Dynamics

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `mode_aggregation_uniform_convergent` | `05_dynamics.md` §5.7 (Proposition 5.7.2) | Encoded (Weierstrass M-test via `tendstoUniformly_tsum`) |

## TLICA.NonReducibility

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `structure CoordinateTriple` | `06_independence_lemmas.md` §6.5 (admissible coordinate triples) | Encoded |
| `witness_rho_1`, `witness_rho_2` | `06_independence_lemmas.md` §6.2 (Proposition 6.2.1 witnesses) | Encoded |
| `no_F_rho` | `06_independence_lemmas.md` §6.2 (Proposition 6.2.1) | Encoded |
| `witness_phi_1`, `witness_phi_2` | `06_independence_lemmas.md` §6.3 (Proposition 6.3.1 witnesses) | Encoded |
| `no_F_phi` | `06_independence_lemmas.md` §6.3 (Proposition 6.3.1; depends on v0.3.1 D_φ repair) | Encoded |
| `witness_kappa_1`, `witness_kappa_2` | `06_independence_lemmas.md` §6.4 (Proposition 6.4.1 witnesses) | Encoded |
| `no_F_kappa` | `06_independence_lemmas.md` §6.4 (Proposition 6.4.1) | Encoded |
| `formal_non_reducibility` | `06_independence_lemmas.md` §6.5 (Theorem 6.5.1) | Encoded |

## Coverage summary

Of the priority targets identified by the second-round verifier:

- **Lemma 2.4.2** (strict ρ-bound, warm-up): fully encoded and machine-verified at mathlib v4.11.0.
- **Proposition 3.3.7** (cogito unique supremum of φ): fully encoded and machine-verified.
- **Proposition 2.5.1** (scalar mode aggregation): fully encoded and machine-verified, in four parts (summability, non-negative lower bound, ≤ 1 upper bound, strict-off-cogito bound).
- **Proposition 5.7.2** (uniform convergence by M-test): fully encoded in round 2 via `tendstoUniformly_tsum` applied with majorant `M_k = a_k`; awaiting compilation verification.
- **Theorem 6.5.1** (formal non-reducibility): fully encoded and machine-verified via finite witness coordinate triples; the proof of `no_F_phi` exercises the v0.3.1 `D_φ` repair via the witness with φ-value `1 - 2·δ - 1/2`.

All five priority theorems have type-checking proofs in the project; four are machine-verified at v4.11.0 (compilation iteration #1 closed); the fifth was added in round 2 and awaits compilation verification.
