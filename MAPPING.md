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
| `mode_aggregation_uniform_convergent` | `05_dynamics.md` §5.7 (Proposition 5.7.2) | Encoded and machine-verified (Weierstrass M-test via `tendstoUniformly_tsum`) |

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
- **Proposition 5.7.2** (uniform convergence by M-test): fully encoded and machine-verified via `tendstoUniformly_tsum` applied with majorant `M_k = a_k`.
- **Theorem 6.5.1** (formal non-reducibility): fully encoded and machine-verified via finite witness coordinate triples; the proof of `no_F_phi` exercises the v0.3.1 `D_φ` repair via the witness with φ-value `1 - 2·δ - 1/2`.

All five priority theorems have type-checking proofs in the project and are machine-verified at mathlib/Lean v4.11.0 in this pass.

## Round 3 — Profile-comparison apparatus

| Lean declaration | v0.2 working paper reference | Status |
|---|---|---|
| `structure ScalarProfile` | profile_comparison_v0_2.md §4 (notation), §5.1 (foundation signature) | Encoded |
| `ScalarProfile.zeroExtend` | profile_comparison_v0_2.md §5.2bis.1 | Encoded |
| `ScalarProfile.zeroExtend_nonneg`, `zeroExtend_le_one`, `abs_sub_zeroExtend_le_one` | Supporting facts | Encoded |
| `dInfUnion` | profile_comparison_v0_2.md §5.2bis.1 (Definition) | Encoded |
| `dInfUnion_nonneg` | §5.2.1 / §5.2bis.2 (non-negativity) | Encoded |
| `dInfUnion_symm` | §5.2.2 (symmetry) | Encoded |
| `dInfUnion_self` | §5.2.3 (reflexivity) | Encoded |
| `dInfUnion_le_one` | §5.1.1 codomain claim | Encoded |
| `dInfUnion_triangle` | §5.2bis.2 (full triangle inequality) | Encoded |
| `dInfShared` | profile_comparison_v0_2.md §5.1.1 (Definition) | Encoded |
| `dInfShared_nonneg` | §5.2.1 (non-negativity) | Encoded |
| `dInfShared_symm` | §5.2.2 (symmetry) | Encoded |
| `dInfShared_self_of_nonempty` | §5.2.3 (reflexivity, qualified) | Encoded |
| `dInfShared_le_one_of_nonempty` | §5.1.1 (bound when non-empty) | Encoded |
| `dInfShared_top_iff` | §5.1.1 (⊤ exactly on empty intersection) | Encoded |
| `dInfShared_le_one_or_top` | Combined bound | Encoded |
| `dInfShared_triangle_of_bridge` | §5.2.6 (qualified triangle inequality, bridge-domain form) | Encoded with full proof |
| `structure ShellThresholds` | v0.3.1 rigorous edition 04_profiles.md §4.3.1 | Encoded (structure only) |
| `shellOf` | Helper for interior half-open shell membership | Encoded definition |
| `sameShellBound_of_shellOf` | Predicate-form same-shell case of profile_comparison_v0_2.md §5.3 | Encoded with full proof |
| `shellStratifiedBound_deferred` | profile_comparison_v0_2.md §5.3 (Proposition 5.3.1 general case) | Non-substantive deferred target marker; not counted as machine-verified theorem |
| `shellStableDistanceVanishing_simple` | profile_comparison_v0_2.md §5.3 (Corollary 5.3.2 simplified) | Encoded with full proof |

The qualified triangle inequality for `dInfShared` is encoded in bridge-domain form:
if every point compared by `dInfShared f h` lies in `g.domain`, then `g`
mediates the pointwise comparison and `dInfShared f h ≤ dInfShared f g + dInfShared g h`.

## Round 4 — Profile-comparison completion + foundation orphan cluster

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `ShellThresholds.maxGap`, `adjacent_gap_pos` | profile_comparison_v0_2.md §5.3 | Encoded |
| `sameShellBound` | Same-shell case of Proposition 5.3.1 | Encoded with full proof |
| `shellStableDistanceVanishing_simple` | Simplified Corollary 5.3.2 | Encoded with full proof |
| `shellStratifiedBound_deferred` | Proposition 5.3.1 general | Deferred target marker only; no theorem claim |
| `ProfileSpace`, `instance : EDist`, `PseudoEMetricSpace` | Round-3 follow-up: pseudo-emetric promotion | Encoded and machine-verified |
| `MSI` structure (cogito_in, density, threshold) | orphan_cluster_v0_1.md §3, Definition 3.2.1 | Encoded |
| `MSI.cogito_is_supremum`, `nonCogito_has_threshold_value`, `mem_msi_positive` | Derived facts from MSI axioms | Encoded with proofs |
| `PreservationRanking` structure with five axioms | orphan_cluster_v0_1.md §4, Definition 4.2.1 + Axioms 4.3.1–4.3.4 | Encoded |
| `PreservationRanking.msi_rank_max`, `PreservationRanking.no_cogito_zero_rank` | Derived from preservation-ranking axioms | Encoded with proofs |
| `ConsistencyEval` inductive type | orphan_cluster_v0_1.md §7.2.1 (Definition) | Encoded |
| `PtCns` structure with cogito-invariance axiom | orphan_cluster_v0_1.md §7.3.1 | Encoded |
| `PtCns.cogito_in_positive`, `cogito_not_negative`, `cogito_not_neutral` | Derived from cogito invariance | Encoded with proofs |
| `PtCns.partition_disjoint`, `PtCns.partition_cover` | Three-way disjointness and coverage of evaluation classes | Encoded with proofs |
| `ModeOp` inductive type | orphan_cluster_v0_1.md §8.2 | Encoded |
| `ModeOp.fromEval`, `cogito_triggers_modeC` | PtCns-triggered mode selection (Axiom 7.3.3) | Encoded |
| `IBoundary.boundary`, `boundary_excludes_neutral`, `cogito_in_boundary`, `mem_boundary_iff`, `boundary_not_neutral` | orphan_cluster_v0_1.md §9 | Encoded with proofs |
| `Action` opaque structure, `ProjectMap` with identity-action axiom | orphan_cluster_v0_1.md §5 (deterministic) | Encoded |
| `PCE` definition, `nonneg`, `eq_rank_msi_contents`, `bounded_by_msi_max`, `every_action_maximizes`, `all_actions_equal` | orphan_cluster_v0_1.md §6 (deterministic foundation default) | Encoded with proofs |

The foundation orphan cluster is encoded at signature-and-default level. The
deterministic foundation default `PCE` remains intentionally constant across
actions. Stochastic projection and refined boundary structure remain deferred.

## Action-calibrated projected PCE

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `FutureMSIModel` | Application-ready cross-time MSI assignment for projected profiles | Encoded structure; uses `domain_match`, not full profile equality |
| `FutureMSIModel.domain_match` | Compatibility between assigned future MSI domain and projected profile domain | Primitive structure-field assumption |
| `GlobalPreservationRanking` | Application-calibrated universal-domain ranking over `Set α` | Encoded structure |
| `GlobalPreservationRanking.rank_nonneg`, `monotone` | Non-negativity and monotonicity calibration conditions | Primitive structure-field assumptions |
| `liftSet`, `liftMSIContents` | Subtype-domain content-set lift into the universal content type | Encoded definitions |
| `projectedProfile`, `futureMSI`, `futureMSIContents` | Deterministic projected profile and future-MSI helper definitions | Encoded definitions |
| `ProjectedPCE` | Action-calibrated projected continued-existence score | Encoded definition |
| `ProjectedPCE.nonneg` | Non-negativity of projected PCE | Encoded with proof |
| `ProjectedPCE.eq_of_future_contents_eq` | Equal lifted future MSI contents imply equal projected PCE | Encoded with proof |
| `ProjectedPCE.ge_of_rank_ge` | Rank comparison implies projected-PCE comparison | Encoded with proof |
| `ProjectedPCE.monotone_of_future_contents_subset` | Future-content inclusion implies projected-PCE monotonicity | Encoded with proof |
| `ProjectedPCE.selectsProjectedAction`, `selected_has_max_projectedPCE` | Projected action-selection and maximality by definition | Encoded definition/proof |
| `ProjectedPCE.strictly_differentiates_of_rank_lt` | Conditional non-degeneracy under strict global-rank inequality | Encoded with proof; no existence claim |

`FutureMSIModel` uses the weaker `domain_match` field because full equality of
`ScalarProfile` values involves dependent functions over subtype domains. This
is sufficient for the projected-PCE layer, which ranks `liftMSIContents` in the
universal content type rather than comparing projected profile functions.

`ActionProjection.ProjectedPCE` is an interface layer over the current
foundation `Action α`. Since `Action α` stores only `Unit`, it is
singleton-like and should not be used as the final agency/free-will action
space.

## Generalized action-space projected PCE

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `GeneralProjectMap` | Application-ready deterministic projection over arbitrary action type `Act` | Encoded structure |
| `GeneralProjectMap.noAction`, `project`, `identity_action_natural` | Null action, deterministic projection, and natural-dynamics compatibility | Primitive structure-field assumptions |
| `generalProjectMapOfProjectMap` | Embedding of existing `ProjectMap α` into the generalized action-space layer | Encoded definition |
| `generalProjectedProfile`, `generalFutureMSI`, `generalFutureMSIContents` | Generic projected-profile and future-MSI helper definitions | Encoded definitions |
| `GeneralProjectedPCE` | Action-calibrated projected PCE over arbitrary action type `Act` | Encoded definition |
| `GeneralProjectedPCE.nonneg` | Non-negativity of generic projected PCE | Encoded with proof |
| `GeneralProjectedPCE.eq_of_future_contents_eq` | Equal lifted future MSI contents imply equal generic projected PCE | Encoded with proof |
| `GeneralProjectedPCE.ge_of_rank_ge` | Rank comparison implies generic projected-PCE comparison | Encoded with proof |
| `GeneralProjectedPCE.monotone_of_future_contents_subset` | Future-content inclusion implies generic projected-PCE monotonicity | Encoded with proof |
| `GeneralProjectedPCE.selectsGeneralProjectedAction`, `selected_has_max_generalProjectedPCE` | Generic action-selection and maximality by definition | Encoded definition/proof |
| `GeneralProjectedPCE.strictly_differentiates_of_rank_lt` | Conditional strict differentiation over arbitrary action type | Encoded with proof; no existence claim |
| `generalProjectedPCE_strictly_differentiates_of_rank_lt` | Explicit top-level conditional theorem that strict differentiation is not blocked by singleton action typing | Encoded with proof; no existence claim |

Agency and free-will formalization should use `GeneralActionProjection` with an
application-supplied `Act`. Deterministic projection remains the current layer;
stochastic projection remains deferred.

## Agency layer

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `AgencyContext` | Agency as feasible action context over generalized projected PCE | Encoded structure |
| `AgencyContext.fam`, `globalRank`, `proj` | Generalized projected-PCE calibration objects | Structure fields |
| `AgencyContext.feasible`, `noAction_feasible` | Feasible action set and no-action feasibility | Primitive structure-field assumptions |
| `feasibleProjectedPCE` | General projected PCE evaluated in an agency context | Encoded definition |
| `selectsFeasibleAction` | Feasible maximizer predicate over available alternatives | Encoded definition |
| `liveAlternative`, `hasLiveAlternatives` | Nontrivial agency via distinct feasible actions | Encoded definitions |
| `pceDifferentiatedAlternative` | Feasible alternatives with different projected-PCE values | Encoded definition |
| `AgencyWitness` | Witness packaging a selected feasible maximizer | Encoded structure |
| `AgencyWitness.selected_is_feasible`, `selected_maximizes`, `selects_selected` | Witness consequences | Encoded with proofs |
| `witness_of_selectsFeasibleAction` | Construct witness from selection predicate | Encoded definition |
| `selectsFeasibleAction_of_witness` | Recover selection predicate from witness | Encoded with proof |
| `not_exists_feasible_strictly_higher_of_selects` | Selected feasible action excludes feasible alternatives with strictly higher projected PCE | Encoded with proof |
| `exists_distinct_feasible_of_hasLiveAlternatives` | Live alternatives imply two distinct feasible actions | Encoded with proof |
| `pceDifferentiatedAlternative_of_selected_strictly_beats` | Strictly beating a feasible alternative gives PCE differentiation | Encoded with proof |
| `finiteFeasibleSelection_deferred` | Deferred marker for finite feasible-action maximizer existence | Non-substantive deferred target marker; no theorem claim |

The agency layer depends on `GeneralActionProjection`. It does not assert that
selected actions exist globally; existence is represented by `AgencyWitness` or
by an explicit `selectsFeasibleAction` hypothesis.

## Free-will layer

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `branchProfile` | Action branch as deterministic projected profile | Encoded definition |
| `branchFutureContents` | Lifted future MSI contents of an action branch | Encoded definition |
| `branchDistinctAlternative` | Live feasible alternatives with distinct future contents | Encoded definition |
| `pceBranchDistinctAlternative` | Live feasible alternatives with distinct projected-PCE values | Encoded definition |
| `openAlternatives` | Feasible action set as open alternatives | Encoded definition |
| `FreeWillWitness` | Branch-sensitive agency witness with selected action and branch-distinct live alternative | Encoded structure |
| `PCEFreeWillWitness` | Stronger witness with projected-PCE-distinct live alternative | Encoded structure |
| `FreeWillWitness.hasLiveAlternatives` | Free-will witness implies live alternatives | Encoded with proof |
| `FreeWillWitness.exists_distinct_feasible` | Free-will witness implies two distinct feasible actions | Encoded with proof |
| `FreeWillWitness.branchDistinctAlternative` | Free-will witness packages branch-distinct alternatives | Encoded with proof |
| `PCEFreeWillWitness.pceDifferentiatedAlternative` | PCE-free-will witness implies agency-layer PCE differentiation | Encoded with proof |
| `PCEFreeWillWitness.pceBranchDistinctAlternative` | PCE-free-will witness packages PCE-branch-distinct alternatives | Encoded with proof |
| `pceFreeWillWitness_of_selected_strictly_beats` | Strict projected-PCE victory over a live alternative constructs a PCE-free-will witness | Encoded definition |
| `no_freeWillWitness_of_all_branch_contents_equal` | If all feasible branch future contents are equal, no branch-distinct free-will witness exists | Encoded with proof |

The free-will layer depends on `Agency`. It is a structural witness theory, not
a universal existence theorem. PCE-differentiated free will is stronger than
branch-distinct free will. Stochastic projection and metaphysical
incompatibilism/compatibilism claims remain deferred.
