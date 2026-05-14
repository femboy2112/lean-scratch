# TLICA Lean Encoding — Declaration Map

Every Lean declaration in this project maps to a specific section, line, or
named result in the v0.3.1 rigorous edition of the formal apparatus. This
file is the cross-reference table that connects the two artifacts.

## Normalized status key

Current Rosetta normalization uses exactly these status categories:

- `machine_verified_definition`
- `machine_verified_theorem`
- `machine_verified_structure`
- `primitive_structure_field`
- `compatibility_alias`
- `compatibility_theorem`
- `deferred_marker_not_theorem`
- `application_deferred`
- `prose_only_unformalized`
- `deprecated_or_superseded`

Earlier branches used broader status wording. This mapping now uses the normalized categories above, with per-declaration coverage recorded in `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md` and normalized object status recorded in `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`.

## v0.4.1 normalized boundary

`ProjectMap α Act` is the primary deterministic projection structure. `GeneralProjectMap`, `GeneralProjectedPCE`, and the `general*` projected-profile/future-content names are compatibility names only. `ProjectedPCE` is the primary application-ready projected-PCE definition over parameterized `ProjectMap α Act`. Active agency, free-will, temporal, and affect modules use the direct API where proof-stable; the remaining compatibility names are intentionally retained in `TLICA.GeneralActionProjection`.

`Action α` is the old singleton wrapper default. `DefaultAction α := Unit` is the direct unit degenerate carrier. `DefaultProjectMap` and `UnitDefaultProjectMap` are degenerate/default compatibility forms.

Foundation primitives include `KField`, `ScalarProfile`, `MSI`, `PreservationRanking`, `ProjectMap α Act`, `FutureMSIModel`, `GlobalPreservationRanking`, and `FeasibilityModel`. Derived/application structures include `AgencyContext`, `AgencyWitness`, `FreeWillWitness`, `PCEFreeWillWitness`, `ProfileTrajectory`, `ActionSchedule`, `AffectKernelWitness`, and the affect witness structures. No global existence of agency, free will, trajectory, or affect is asserted.

## TLICA.Basic

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `class KField` | `00_signature.md` §0.3 (K-field requirements) | `machine_verified_definition` |
| `KField.δ` | `00_signature.md` §0.3, §0.6 (positive infinitesimal δ) | `machine_verified_definition` |
| `KField.δ_pos` | `00_signature.md` §0.3 (δ > 0) | `machine_verified_definition` |
| `KField.δ_lt_one` | `00_signature.md` §0.3 (δ < 1) | `machine_verified_definition` |
| `KField.δ_lt_rat` | `00_signature.md` §0.3 (non-Archimedean property) | `machine_verified_definition` |
| `KField.one_sub_δ_pos`, `δ_lt_half` | Derived helpers used downstream | `machine_verified_definition` |

## TLICA.IntegrationGraph

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `strict_rho_bound` | `02_graph_theory.md` §2.4 (Lemma 2.4.2) | `machine_verified_theorem` |
| `strict_quotient_bound_field` | Field-generic form of Lemma 2.4.2 | `machine_verified_definition` |
| `rho_nonneg` | Range corollary of Lemma 2.4.2 | `machine_verified_definition` |

## TLICA.PhiCoordinate

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `phiCogito` | `00_signature.md` §0.6 (cogito φ-axiom) | `machine_verified_definition` |
| `phiTier3` | `03_coordinates.md` §3.3.3 (Tier-3 formula) | `machine_verified_definition` |
| `PhiAdmissibility` | `00_signature.md` §0.14 (φ-admissibility axiom, lines 143-149) | `machine_verified_definition` |
| `Tier3Strictness` | `00_signature.md` §0.14 (Tier-3 strictness axiom, lines 151-157) | `machine_verified_definition` |
| `phi_tier3_nonneg` | `03_coordinates.md` §3.3.6 (a), lower half | `machine_verified_definition` |
| `phi_tier3_le_phiCogito` | `03_coordinates.md` §3.3.6 (a), upper non-strict half | `machine_verified_definition` |
| `phi_tier3_lt_phiCogito` | `03_coordinates.md` §3.3.6 (Proposition 3.3.7, strict form) | `machine_verified_definition` |
| `cogito_unique_phi_supremum` | `03_coordinates.md` §3.3.6 (combined statement) | `machine_verified_definition` |
| `DPhi` | `06_independence_lemmas.md` §6.5 (admissible φ-domain, v0.3.1 repair) | `machine_verified_definition` |
| `two_delta_minus_real_in_DPhi` | `06_independence_lemmas.md` §6.5 (D_φ ⊋ (1-δ-ℝ_{≥0})) | `machine_verified_definition` |

## TLICA.ModeAggregation

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `mode_aggregation_summable` | `02_graph_theory.md` §2.5 (i) (absolute convergence) | `machine_verified_definition` |
| `mode_aggregation_nonneg` | `02_graph_theory.md` §2.5 (ii) lower bound | `machine_verified_definition` |
| `mode_aggregation_le_one` | `02_graph_theory.md` §2.5 (ii) upper bound | `machine_verified_definition` |
| `mode_aggregation_lt_one` | `02_graph_theory.md` §2.5 (iii) strict bound off cogito | `machine_verified_definition` |

## TLICA.Dynamics

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `mode_aggregation_uniform_convergent` | `05_dynamics.md` §5.7 (Proposition 5.7.2) | `machine_verified_theorem` |

## TLICA.NonReducibility

| Lean declaration | v0.3.1 reference | Status |
|---|---|---|
| `structure CoordinateTriple` | `06_independence_lemmas.md` §6.5 (admissible coordinate triples) | `machine_verified_definition` |
| `witness_rho_1`, `witness_rho_2` | `06_independence_lemmas.md` §6.2 (Proposition 6.2.1 witnesses) | `machine_verified_definition` |
| `no_F_rho` | `06_independence_lemmas.md` §6.2 (Proposition 6.2.1) | `machine_verified_definition` |
| `witness_phi_1`, `witness_phi_2` | `06_independence_lemmas.md` §6.3 (Proposition 6.3.1 witnesses) | `machine_verified_definition` |
| `no_F_phi` | `06_independence_lemmas.md` §6.3 (Proposition 6.3.1; depends on v0.3.1 D_φ repair) | `machine_verified_definition` |
| `witness_kappa_1`, `witness_kappa_2` | `06_independence_lemmas.md` §6.4 (Proposition 6.4.1 witnesses) | `machine_verified_definition` |
| `no_F_kappa` | `06_independence_lemmas.md` §6.4 (Proposition 6.4.1) | `machine_verified_definition` |
| `formal_non_reducibility` | `06_independence_lemmas.md` §6.5 (Theorem 6.5.1) | `machine_verified_definition` |

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
| `structure ScalarProfile` | profile_comparison_v0_2.md §4 (notation), §5.1 (foundation signature) | `machine_verified_definition` |
| `ScalarProfile.zeroExtend` | profile_comparison_v0_2.md §5.2bis.1 | `machine_verified_definition` |
| `ScalarProfile.zeroExtend_nonneg`, `zeroExtend_le_one`, `abs_sub_zeroExtend_le_one` | Supporting facts | `machine_verified_definition` |
| `dInfUnion` | profile_comparison_v0_2.md §5.2bis.1 (Definition) | `machine_verified_definition` |
| `dInfUnion_nonneg` | §5.2.1 / §5.2bis.2 (non-negativity) | `machine_verified_definition` |
| `dInfUnion_symm` | §5.2.2 (symmetry) | `machine_verified_definition` |
| `dInfUnion_self` | §5.2.3 (reflexivity) | `machine_verified_definition` |
| `dInfUnion_le_one` | §5.1.1 codomain claim | `machine_verified_definition` |
| `dInfUnion_triangle` | §5.2bis.2 (full triangle inequality) | `machine_verified_definition` |
| `dInfShared` | profile_comparison_v0_2.md §5.1.1 (Definition) | `machine_verified_definition` |
| `dInfShared_nonneg` | §5.2.1 (non-negativity) | `machine_verified_definition` |
| `dInfShared_symm` | §5.2.2 (symmetry) | `machine_verified_definition` |
| `dInfShared_self_of_nonempty` | §5.2.3 (reflexivity, qualified) | `machine_verified_definition` |
| `dInfShared_le_one_of_nonempty` | §5.1.1 (bound when non-empty) | `machine_verified_definition` |
| `dInfShared_top_iff` | §5.1.1 (⊤ exactly on empty intersection) | `machine_verified_definition` |
| `dInfShared_le_one_or_top` | Combined bound | `machine_verified_definition` |
| `dInfShared_triangle_of_bridge` | §5.2.6 (qualified triangle inequality, bridge-domain form) | `machine_verified_theorem` |
| `structure ShellThresholds` | v0.3.1 rigorous edition 04_profiles.md §4.3.1 | `machine_verified_structure` |
| `shellOf`, `interiorShellIndexDistance`, `ShellIndex7`, `shellLowerEndpoint`, `shellUpperEndpoint`, `shellEndpointBound`, `shellOf7` | Helper definitions for interior and boundary-aware shell membership | `machine_verified_definition` |
| `interiorShellIndexDistance_self`, `interiorShellIndexDistance_symm`, `shellOf_nonneg`, `shellOf_le_one`, `shellOf7_lower_le`, `shellOf7_le_upper`, `shellOf7_mem_Icc_zero_one`, `shellOf7_cogito_value`, `shellOf7_outer_bound`, `shellEndpointBound_nonneg`, `shellEndpointBound_self_cogito`, `shellEndpointBound_symm` | Interior shell-distance helper facts, interior and boundary-aware shell-membership bounds induced by threshold normalization, plus endpoint-bound helper facts | `machine_verified_theorem` |
| `sameShellBound_of_shellOf`, `sameInteriorShell_distance_bound` | Predicate-form same-shell/interior-shell case of profile_comparison_v0_2.md §5.3 | `machine_verified_theorem` |
| `interiorShell_pair_bound`, `sameCogitoShell_bound`, `sameOuterShell_bound`, `abs_sub_le_max_endpoint_abs`, `fullShellStratifiedBound`, `fullShellStratifiedBound_endpointBound` | Conservative cross-interior bound, boundary same-shell bounds, and full boundary-aware pointwise shell-stratified bound | `machine_verified_theorem` |
| `shellStratifiedBound_deferred` | profile_comparison_v0_2.md §5.3 legacy marker superseded by `fullShellStratifiedBound` | `deprecated_or_superseded` |
| `shellStableDistanceBound_of_pointwise`, `dInfShared_le_shellEndpointBound_zeroExtend`, `dInfShared_le_shellEndpointBound`, `dInfShared_le_of_pointwise_shellEndpointBound`, `dInfShared_le_sameInteriorShellEndpointBound`, `shellStableDistanceVanishing_simple` | profile_comparison_v0_2.md §5.3 (profile-level shared-distance shell-stability bounds) | `machine_verified_theorem` |
| `dInfUnion_le_of_pointwise`, `dInfUnion_le_of_pointwise_union`, `dInfUnion_le_shellEndpointBound_zeroExtend`, `dInfUnion_le_threeWayMax_shellEndpointBound`, `dInfUnion_le_of_pointwise_shellEndpointBound` | profile_comparison_v0_2.md §5.3 (union-form shell-stability bounds via zero-extension and outer-shell absorption) | `machine_verified_theorem` |

The qualified triangle inequality for `dInfShared` is encoded in bridge-domain form:
if every point compared by `dInfShared f h` lies in `g.domain`, then `g`
mediates the pointwise comparison and `dInfShared f h ≤ dInfShared f g + dInfShared g h`.

## Round 4 — Profile-comparison completion + foundation orphan cluster

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `ShellThresholds.maxGap`, `adjacent_gap_pos` | profile_comparison_v0_2.md §5.3 | `machine_verified_definition` |
| `sameShellBound` | Same-shell case of Proposition 5.3.1 | `machine_verified_theorem` |
| `ShellIndex7`, `shellOf7`, `shellEndpointBound`, `interiorShellIndexDistance_self`, `interiorShellIndexDistance_symm`, `sameInteriorShell_distance_bound`, `interiorShell_pair_bound`, `sameCogitoShell_bound`, `sameOuterShell_bound`, `fullShellStratifiedBound`, `fullShellStratifiedBound_endpointBound`, `dInfShared_le_shellEndpointBound_zeroExtend`, `dInfShared_le_shellEndpointBound`, `dInfShared_le_of_pointwise_shellEndpointBound`, `dInfShared_le_sameInteriorShellEndpointBound`, `shellStableDistanceBound_of_pointwise`, `shellStableDistanceVanishing_simple`, `dInfUnion_le_of_pointwise`, `dInfUnion_le_of_pointwise_union`, `dInfUnion_le_shellEndpointBound_zeroExtend`, `dInfUnion_le_threeWayMax_shellEndpointBound`, `dInfUnion_le_of_pointwise_shellEndpointBound` | Boundary-aware and interior shell-bound package for Proposition 5.3.1 and Corollary 5.3.2 | `machine_verified_theorem` |
| `shellStratifiedBound_deferred` | Proposition 5.3.1 legacy marker | `deprecated_or_superseded` |
| `ProfileSpace`, `instance : EDist`, `PseudoEMetricSpace` | Round-3 follow-up: pseudo-emetric promotion | `machine_verified_definition` |
| `MSI` structure (cogito_in, density, threshold) | orphan_cluster_v0_1.md §3, Definition 3.2.1 | `machine_verified_definition` |
| `MSI.cogito_is_supremum`, `nonCogito_has_threshold_value`, `mem_msi_positive` | Derived facts from MSI axioms | `machine_verified_theorem` |
| `PreservationRanking` structure with five axioms | orphan_cluster_v0_1.md §4, Definition 4.2.1 + Axioms 4.3.1–4.3.4 | `machine_verified_definition` |
| `PreservationRanking.msi_rank_max`, `PreservationRanking.no_cogito_zero_rank` | Derived from preservation-ranking axioms | `machine_verified_theorem` |
| `ConsistencyEval` inductive type | orphan_cluster_v0_1.md §7.2.1 (Definition) | `machine_verified_definition` |
| `PtCns` structure with cogito-invariance axiom | orphan_cluster_v0_1.md §7.3.1 | `machine_verified_definition` |
| `PtCns.cogito_in_positive`, `cogito_not_negative`, `cogito_not_neutral` | Derived from cogito invariance | `machine_verified_theorem` |
| `PtCns.partition_disjoint`, `PtCns.partition_cover` | Three-way disjointness and coverage of evaluation classes | `machine_verified_theorem` |
| `ModeOp` inductive type | orphan_cluster_v0_1.md §8.2 | `machine_verified_definition` |
| `ModeOp.fromEval`, `cogito_triggers_modeC` | PtCns-triggered mode selection (Axiom 7.3.3) | `machine_verified_definition` |
| `IBoundary.boundary`, `boundary_excludes_neutral`, `cogito_in_boundary`, `mem_boundary_iff`, `boundary_not_neutral` | orphan_cluster_v0_1.md §9 | `machine_verified_theorem` |
| `Action`, `DefaultAction`, `Action.noAction` | Degenerate/singleton default action cases retained for compatibility; `Action α` is the old wrapper and `DefaultAction α := Unit` is the simplest carrier | `machine_verified_definition` |
| `ProjectMap`, `ProjectMap.noAction`, `ProjectMap.project`, `ProjectMap.identity_action_natural`, `ProjectMap.noAction_projects` | orphan_cluster_v0_1.md §5 deterministic projection, now parameterized by arbitrary action type `Act` | `machine_verified_structure`; `primitive_structure_field`; `machine_verified_theorem` |
| `DefaultProjectMap`, `UnitDefaultProjectMap` | Compatibility abbreviations for old wrapper and unit-carrier degenerate projection shapes | `compatibility_alias` |
| `PCE` definition, `nonneg`, `eq_rank_msi_contents`, `bounded_by_msi_max`, `every_action_maximizes`, `all_actions_equal` | orphan_cluster_v0_1.md §6 deterministic foundation default, now action-constant over arbitrary `Act` | `machine_verified_theorem` |

The v0.4.1 consolidation does not add a new theory layer. The foundation orphan cluster is encoded at signature-and-default level.
Application pressure revealed that the old singleton `Action α` was too weak,
so `ProjectMap` is now parameterized over arbitrary action type `Act`. The old
singleton/default action case is preserved as a degenerate compatibility case.
The deterministic foundation default `PCE` remains intentionally constant
across actions over arbitrary `Act`; this is not the application-calibrated
`ProjectedPCE`. Stochastic projection and refined boundary structure remain
deferred.

## Action-calibrated projected PCE

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `FutureMSIModel` | Application-ready cross-time MSI assignment for projected profiles | `machine_verified_structure`; uses `domain_match`, not full profile equality |
| `FutureMSIModel.domain_match` | Compatibility between assigned future MSI domain and projected profile domain | `primitive_structure_field` |
| `ProfileIso`, `ProfileIso.dom_mem_iff`, `ProfileIso.val_eq_left`, `ProfileIso.val_eq_right`, `ProfileIso.refl`, `ProfileIso.symm`, `ProfileIso.trans` | Optional extensional profile-coherence relation and membership/value transport helpers | `machine_verified_structure`/definitions; `machine_verified_theorem` |
| `CoherentFutureMSIModel`, `CoherentFutureMSIModel.toFutureMSIModel`, `CoherentFutureMSIModel.toFutureMSIModel_domain_match`, `CoherentFutureMSIModel.profile_iso_to_domain_match`, `CoherentFutureMSIModel.toFutureMSIModel_msiOf` | Optional stronger future-MSI model with profile-isomorphism coherence, projected to the weaker model | `machine_verified_structure`; `machine_verified_definition`; `machine_verified_theorem` |
| `GlobalPreservationRanking` | Application-calibrated universal-domain ranking over `Set α` | `machine_verified_structure` |
| `GlobalPreservationRanking.rank_nonneg`, `monotone` | Non-negativity and monotonicity calibration conditions | `primitive_structure_field` |
| `liftSet`, `liftMSIContents` | Subtype-domain content-set lift into the universal content type | `machine_verified_definition` |
| `projectedProfile`, `futureMSI`, `futureMSIContents` | Deterministic projected profile and future-MSI helper definitions | `machine_verified_definition` |
| `ProjectedPCE` | Primary application-ready action-calibrated projected continued-existence score over `ProjectMap α Act` | `machine_verified_definition` |
| `ProjectedPCE.nonneg` | Non-negativity of projected PCE | `machine_verified_theorem` |
| `ProjectedPCE.eq_of_future_contents_eq` | Equal lifted future MSI contents imply equal projected PCE | `machine_verified_theorem` |
| `ProjectedPCE.ge_of_rank_ge` | Rank comparison implies projected-PCE comparison | `machine_verified_theorem` |
| `ProjectedPCE.monotone_of_future_contents_subset` | Future-content inclusion implies projected-PCE monotonicity | `machine_verified_theorem` |
| `ProjectedPCE.selectsProjectedAction`, `selected_has_max_projectedPCE` | Projected action-selection and maximality by definition | `machine_verified_definition`; `machine_verified_theorem` |
| `ProjectedPCE.strictly_differentiates_of_rank_lt` | Conditional non-degeneracy under strict global-rank inequality | `machine_verified_theorem` |

`FutureMSIModel` uses the weaker `domain_match` field by default. The optional
`CoherentFutureMSIModel` records stronger `ProfileIso` coherence and projects
back to the weaker model. The combination of `FutureMSIModel` and
`GlobalPreservationRanking` held up across the agency, free-will, temporal, and
differentiated-affect layers.

`ActionProjection.ProjectedPCE` is now the primary application-ready
projected-PCE definition, parameterized by arbitrary action type through the
foundation `ProjectMap α Act`.

## Generalized action-space projected PCE

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `GeneralProjectMap` | Compatibility alias for parameterized foundation `ProjectMap α Act` | `compatibility_alias` |
| `generalProjectMapOfProjectMap` | Identity compatibility bridge from `ProjectMap α (Action α)` to the general-name layer | `compatibility_alias` |
| `generalProjectedProfile`, `generalFutureMSI`, `generalFutureMSIContents` | Generic projected-profile and future-MSI compatibility helper definitions | `compatibility_alias` |
| `generalProjectedProfile_eq_projectedProfile`, `generalFutureMSI_eq_futureMSI`, `generalFutureMSIContents_eq_futureMSIContents` | Compatibility equalities to the primary direct `ProjectMap α Act` API | `compatibility_theorem` |
| `GeneralProjectedPCE` | Compatibility wrapper for `ProjectedPCE` over arbitrary action type `Act` | `compatibility_alias` |
| `generalProjectedPCE_eq_projectedPCE` | Compatibility equality to primary `ProjectedPCE` | `compatibility_theorem` |
| `GeneralProjectedPCE.nonneg` | Non-negativity of generic projected PCE | `machine_verified_theorem` |
| `GeneralProjectedPCE.eq_of_future_contents_eq` | Equal lifted future MSI contents imply equal generic projected PCE | `machine_verified_theorem` |
| `GeneralProjectedPCE.ge_of_rank_ge` | Rank comparison implies generic projected-PCE comparison | `machine_verified_theorem` |
| `GeneralProjectedPCE.monotone_of_future_contents_subset` | Future-content inclusion implies generic projected-PCE monotonicity | `machine_verified_theorem` |
| `GeneralProjectedPCE.selectsGeneralProjectedAction`, `selected_has_max_generalProjectedPCE` | Generic action-selection and maximality by definition | `machine_verified_definition`; `machine_verified_theorem` |
| `GeneralProjectedPCE.strictly_differentiates_of_rank_lt` | Conditional strict differentiation over arbitrary action type | `machine_verified_theorem` |
| `generalProjectedPCE_strictly_differentiates_of_rank_lt` | Explicit top-level conditional theorem that strict differentiation is not blocked by singleton action typing | `machine_verified_theorem` |

`GeneralActionProjection` is retained only as a compatibility naming layer.
There is now one primitive deterministic projection structure:
`ProjectMap α Act`. Deterministic projection remains the current layer;
stochastic projection remains deferred.

## Agency layer

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `AgencyContext` | Agency as feasible action context over the direct `ProjectMap α Act` / `ProjectedPCE` API | `machine_verified_structure` |
| `AgencyContext.fam`, `globalRank`, `proj` | Projected-PCE calibration objects | `primitive_structure_field` |
| `FeasibilityModel`, `FeasibilityModel.feasible`, `FeasibilityModel.noAction_feasible` | Project-map-indexed feasible-action model with no-action feasibility | `machine_verified_structure`; `primitive_structure_field` |
| `AgencyContext.feasibility`, `AgencyContext.feasible`, `AgencyContext.noAction_feasible`, `AgencyContext.mkFromFeasible` | Agency feasibility supplied by reusable `FeasibilityModel`, with constructor from explicit feasible-set data | `machine_verified_definition` |
| `feasibleProjectedPCE`, `feasibleProjectedPCE_eq_projectedPCE` | Projected PCE evaluated in an agency context, with direct `ProjectedPCE` API bridge | `machine_verified_definition`; `machine_verified_theorem` |
| `selectsFeasibleAction` | Feasible maximizer predicate over available alternatives | `machine_verified_definition` |
| `liveAlternative`, `hasLiveAlternatives` | Nontrivial agency via distinct feasible actions | `machine_verified_definition` |
| `pceDifferentiatedAlternative` | Feasible alternatives with different projected-PCE values | `machine_verified_definition` |
| `AgencyWitness` | Witness packaging a selected feasible maximizer | `machine_verified_structure` |
| `AgencyWitness.selected_is_feasible`, `selected_maximizes`, `selects_selected` | Witness consequences | `machine_verified_theorem` |
| `witness_of_selectsFeasibleAction` | Construct witness from selection predicate | `machine_verified_definition` |
| `selectsFeasibleAction_of_witness` | Recover selection predicate from witness | `machine_verified_theorem` |
| `not_exists_feasible_strictly_higher_of_selects` | Selected feasible action excludes feasible alternatives with strictly higher projected PCE | `machine_verified_theorem` |
| `exists_distinct_feasible_of_hasLiveAlternatives` | Live alternatives imply two distinct feasible actions | `machine_verified_theorem` |
| `pceDifferentiatedAlternative_of_selected_strictly_beats` | Strictly beating a feasible alternative gives PCE differentiation | `machine_verified_theorem` |
| `exists_selectsFeasibleAction_of_finset`, `exists_selectsFeasibleAction_of_finite_feasible`, `exists_selectsFeasibleAction_of_fintype` | Finite feasible-action maximizer existence wrappers | `machine_verified_theorem` |

The agency layer now uses the direct `ProjectMap α Act` / `ProjectedPCE` API.
It does not assert that selected actions exist globally; existence is
represented by `AgencyWitness` or by an explicit `selectsFeasibleAction`
hypothesis. The older `GeneralActionProjection` names remain available only as
compatibility aliases and theorems.

## Free-will layer

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `branchProfile`, `branchProfile_eq_projectedProfile` | Action branch as deterministic projected profile, with direct projected-profile API bridge | `machine_verified_definition`; `machine_verified_theorem` |
| `branchFutureContents`, `branchFutureContents_eq_futureMSIContents` | Lifted future MSI contents of an action branch, with direct future-MSI contents API bridge | `machine_verified_definition`; `machine_verified_theorem` |
| `branchDistinctAlternative` | Live feasible alternatives with distinct future contents | `machine_verified_definition` |
| `pceBranchDistinctAlternative` | Live feasible alternatives with distinct projected-PCE values | `machine_verified_definition` |
| `openAlternatives` | Feasible action set as open alternatives | `machine_verified_definition` |
| `branchFutureContents_ne_of_pce_ne` | Projected-PCE difference implies branch future content difference | `machine_verified_theorem` |
| `branchDistinctAlternative_of_pceBranchDistinctAlternative` | PCE-branch distinct alternatives imply branch-distinct alternatives | `machine_verified_theorem` |
| `FreeWillWitness` | Branch-sensitive agency witness with selected action and branch-distinct live alternative | `machine_verified_structure` |
| `PCEFreeWillWitness` | Stronger witness with projected-PCE-distinct live alternative | `machine_verified_structure` |
| `FreeWillWitness.hasLiveAlternatives` | Free-will witness implies live alternatives | `machine_verified_theorem` |
| `FreeWillWitness.exists_distinct_feasible` | Free-will witness implies two distinct feasible actions | `machine_verified_theorem` |
| `FreeWillWitness.branchDistinctAlternative` | Free-will witness packages branch-distinct alternatives | `machine_verified_theorem` |
| `PCEFreeWillWitness.toFreeWillWitness`, `freeWillWitness_of_pceFreeWillWitness` | PCE-differentiated free will implies branch-distinct free will | `machine_verified_definition` |
| `PCEFreeWillWitness.hasLiveAlternatives` | PCE-free-will witness implies live alternatives | `machine_verified_theorem` |
| `PCEFreeWillWitness.pceDifferentiatedAlternative` | PCE-free-will witness implies agency-layer PCE differentiation | `machine_verified_theorem` |
| `PCEFreeWillWitness.pceBranchDistinctAlternative` | PCE-free-will witness packages PCE-branch-distinct alternatives | `machine_verified_theorem` |
| `pceFreeWillWitness_of_selected_strictly_beats` | Strict projected-PCE victory over a live alternative constructs a PCE-free-will witness | `machine_verified_definition` |
| `freeWillWitness_of_selected_strictly_beats` | Strict projected-PCE victory over a live alternative constructs a branch-distinct free-will witness | `machine_verified_definition` |
| `no_freeWillWitness_of_all_branch_contents_equal` | If all feasible branch future contents are equal, no branch-distinct free-will witness exists | `machine_verified_theorem` |
| `no_pceFreeWillWitness_of_all_branch_contents_equal` | Branch collapse excludes PCE-free-will witnesses | `machine_verified_theorem` |
| `no_pceFreeWillWitness_of_all_pce_equal` | Projected-PCE collapse excludes PCE-free-will witnesses | `machine_verified_theorem` |

The free-will layer depends on `Agency`. It is a structural witness theory, not
a universal existence theorem. PCE-differentiated free will is now
machine-verified as stronger than branch-distinct free will. Branch collapse
excludes both witness types, and projected-PCE collapse excludes PCE-free-will
witnesses. Stochastic projection and metaphysical
incompatibilism/compatibilism claims remain deferred.

## Temporal-trajectory layer

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `ProfileTrajectory` | Natural-time indexed sequence of scalar profiles | `machine_verified_structure` |
| `ActionSchedule` | Natural-time indexed action schedule | `machine_verified_structure` |
| `generatedBy`, `generatedBy_step`, `generatedBy_step_projectedProfile` | Predicate that a supplied trajectory follows deterministic action-indexed projection, plus named step equations | `machine_verified_definition`; `machine_verified_theorem` |
| `trajectoryFutureContents`, `trajectoryFutureContents_eq_branchFutureContents`, `trajectoryFutureContents_eq_futureMSIContents` | Lifted future MSI contents of the scheduled branch at a trajectory time, with branch and direct future-MSI contents API bridges | `machine_verified_definition`; `machine_verified_theorem` |
| `stepUnionDistance`, `stepUnionDistance_nonneg`, `stepUnionDistance_le_one` | Adjacent-time union-domain profile distance and basic bounds | `machine_verified_definition`; `machine_verified_theorem` |
| `stepSharedDistance` | Adjacent-time shared-domain profile distance | `machine_verified_definition` |
| `unionStepStable`, `unionStepStable_step_le` | Uniform stepwise temporal stability via `dInfUnion` and pointwise elimination | `machine_verified_definition`; `machine_verified_theorem` |
| `eventuallyUnionStepStable`, `eventuallyUnionStepStable_of_le_start`, `eventuallyUnionStepStable_of_unionStepStable` | Eventual stepwise temporal stability via `dInfUnion`, later-start monotonicity, and uniform-to-eventual bridge | `machine_verified_definition`; `machine_verified_theorem` |
| `DivergentTrajectories` | Supplied trajectories with a witnessed profile difference at some time | `machine_verified_structure` |
| `oneStepBranch`, `oneStepBranchUnionDistance`, `oneStepBranchUnionDistance_eq_dInfUnion` | One-step deterministic branch profile and union-distance naming bridges | `machine_verified_definition`; `machine_verified_theorem` |
| `freeWillWitness_live_branch_contents_distinct` | Free-will witness supplies live feasible actions with distinct branch future contents | `machine_verified_theorem` |
| `freeWillWitness_oneStep_branch_contents_distinct` | Selected and alternative one-step branch futures of a free-will witness differ | `machine_verified_theorem` |
| `pceFreeWillWitness_oneStep_branch_contents_distinct` | PCE-free-will witness gives the same branch-future distinction through `toFreeWillWitness` | `machine_verified_theorem` |
| `stochasticTrajectory_deferred` | Stochastic trajectory models | `deferred_marker_not_theorem` |
| `phenomenologicalDuration_deferred` | Phenomenological duration model | `deferred_marker_not_theorem` |
| `temporalContinuityMetric_deferred` | Richer temporal-continuity metric | `deferred_marker_not_theorem` |

The temporal-trajectory layer depends on `FreeWill`, and through it on
`Agency`; it also uses the direct `projectedProfile` API and the existing
pointwise profile-comparison distances. Trajectories are supplied as indexed
data and are verified by `generatedBy` when appropriate. The layer does not
assert global trajectory existence, stochastic dynamics, phenomenological
duration, or differentiated affect.

## Differentiated-affect layer

| Lean declaration | Working-paper reference | Status |
|---|---|---|
| `relativePCEDelta` | Projected-PCE delta of an action relative to a baseline action | `machine_verified_definition` |
| `pceSupportive`, `pceNeutral`, `pceDefeating` | Relative PCE-support, PCE-neutrality, and PCE-defeat predicates | `machine_verified_definition` |
| `pceSupportive_iff`, `pceNeutral_iff`, `pceDefeating_iff` | Real-arithmetic characterizations of relative PCE valence | `machine_verified_theorem` |
| `pceValence_trichotomy` | Relative PCE valence is supportive, neutral, or defeating | `machine_verified_theorem` |
| `pceSupportive_not_neutral`, `pceSupportive_not_defeating`, `pceDefeating_not_neutral` | Basic mutual exclusions for PCE valence | `machine_verified_theorem` |
| `branchUnionDistance`, `branchUnionDistance_nonneg`, `branchUnionDistance_le_one`, `branchUnionDistance_self`, `branchUnionDistance_symm`, `branchUnionDistance_triangle`, `branchSharedDistance` | Profile distances between deterministic action branches and union-distance bounds/metric-style helpers | `machine_verified_definition`; `machine_verified_theorem` |
| `branchProfileShift` | Equality-based branch-profile shift predicate | `machine_verified_definition` |
| `branchFutureContents_eq_of_branchProfile_eq`, `branchProfile_ne_of_branchFutureContents_ne` | Branch-profile equality implies future-content equality; branch future-content difference implies profile shift | `machine_verified_theorem` |
| `PCESupportAffectWitness`, `PCEDefeatAffectWitness`, `PCENeutralAffectWitness`, `pceSupportAffectWitness_pce_ne` | Feasible-action witnesses for relative PCE appraisal and support non-neutrality | `machine_verified_structure`; `machine_verified_theorem` |
| `ProfileShiftAffectWitness` | Feasible-action witness for branch-profile shift | `machine_verified_structure` |
| `AffectKernelWitness` | Minimal affect-relevant structural perturbation: branch-profile shift or PCE differentiation | `machine_verified_structure` |
| `affectKernel_of_pceSupport`, `affectKernel_of_pceDefeat`, `affectKernel_of_profileShift` | Support/defeat/profile-shift witnesses imply affect-kernel witnesses | `machine_verified_definition` |
| `profileShiftAffectWitness_of_freeWillWitness`, `affectKernel_of_freeWillWitness` | Free-will witness yields profile-shift affect kernel | `machine_verified_definition` |
| `affectKernel_of_pceFreeWillWitness` | PCE-free-will witness yields PCE-differentiated affect kernel | `machine_verified_definition` |
| `no_affectKernel_of_branch_and_pce_collapse` | Branch-profile and projected-PCE collapse excludes affect-kernel witnesses | `machine_verified_theorem` |
| `temporalAffectIntensity`, `temporalAffectIntensity_nonneg`, `temporalAffectIntensity_le_of_unionStepStable`, `temporalAffectIntensity_le_one` | Temporal affect-intensity naming bridge via adjacent union-profile distance | `machine_verified_definition`; `machine_verified_theorem` |
| `namedAffectTaxonomy_deferred`, `loveConstitutiveExtension_deferred`, `substrateAffectPathway_deferred`, `sourceOpacityAffect_deferred` | Named affect taxonomy and non-profile/PCE pathways | `deferred_marker_not_theorem` |

The differentiated-affect layer depends on `TemporalTrajectory`, and through it
on `FreeWill` and `Agency`; it uses the direct future-MSI-content API. It
formalizes only the first profile/PCE affect kernel. PCE-support, PCE-defeat,
and PCE-neutrality are relative to a baseline action. Named affect taxonomy,
substrate affect pathways, and source-opacity pathways remain deferred.
