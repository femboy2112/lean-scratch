# Rosetta Math-First Ledger — Seed v0.0

This ledger starts from the round-4 Lean handoff and should be expanded by Codex. It is not the final Rosetta stone. It is the math-first working ledger.

## A. Status key

This file now uses the following stable object-ID families:

- Foundation/base: `FND-###`
- Profile comparison: `PRF-###`
- Orphan/foundation extension: `ORP-###`
- Action/projection refinement: `ACT-###`
- Agency: `AGY-###`
- Free will: `FWL-###`
- Temporal trajectory: `TMP-###`
- Differentiated affect: `AFF-###`
- Religiously charged experience: `RCX-DEFERRED` only for now

Status values are restricted to these exact categories. Rows that collect both a structure and its field theorems may list more than one category, separated by semicolons.

| Status category | Meaning |
|---|---|
| `machine_verified_definition` | Lean definition or abbreviation imported by the build. |
| `machine_verified_theorem` | Lean theorem/lemma imported by the build. |
| `machine_verified_structure` | Lean structure/class/inductive declaration imported by the build. |
| `primitive_structure_field` | Assumption carried as a named structure/class field, not proved. |
| `compatibility_alias` | Name retained for branch/API continuity over a primary object. |
| `compatibility_theorem` | Theorem showing compatibility names coincide with primary names. |
| `deferred_marker_not_theorem` | Explicit marker such as `..._deferred`; not evidence for the deferred claim. |
| `application_deferred` | Application concept intentionally not formalized in the current Lean layer. |
| `prose_only_unformalized` | Rosetta/prose item not yet prepared as a Lean target. |
| `deprecated_or_superseded` | Historical row/name retained only through a crosswalk or compatibility note. |

## B. Active normalized ledger

Active rows use only the normalized ID families listed above. Historical IDs appear only in the crosswalk below.

### Normalized application-layer rows

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| ACT-001 | Future MSI model | Assignment from projected profiles to MSI structures with weak domain compatibility | `FutureMSIModel` | `machine_verified_structure`; `primitive_structure_field` | action-projection refinement |
| ACT-002 | Optional future-MSI coherence | Profile isomorphism and coherent model projecting to weak `FutureMSIModel`, with membership/value transport and domain-match helpers | `ProfileIso`, `ProfileIso.dom_mem_iff`, `ProfileIso.val_eq_left`, `ProfileIso.val_eq_right`, `CoherentFutureMSIModel`, `CoherentFutureMSIModel.toFutureMSIModel`, `CoherentFutureMSIModel.toFutureMSIModel_domain_match`, `CoherentFutureMSIModel.profile_iso_to_domain_match`, `CoherentFutureMSIModel.toFutureMSIModel_msiOf` | `machine_verified_structure`; `machine_verified_definition`; `machine_verified_theorem` | v0.4/v0.4.1 foundation refinement |
| ACT-003 | Universal-domain preservation ranking | Nonnegative monotone rank over sets of contents | `GlobalPreservationRanking` | `machine_verified_structure`; `primitive_structure_field` | action-projection refinement |
| ACT-004 | Lifted deterministic future contents | Projected profile, future MSI, and lifted future-content set | `liftSet`, `liftMSIContents`, `projectedProfile`, `futureMSI`, `futureMSIContents` | `machine_verified_definition` | action-projection refinement |
| ACT-005 | Primary action-calibrated projected PCE | Application-ready projected PCE over `ProjectMap α Act` | `ProjectedPCE`, `ProjectedPCE.nonneg`, `ProjectedPCE.eq_of_future_contents_eq`, `ProjectedPCE.ge_of_rank_ge`, `ProjectedPCE.monotone_of_future_contents_subset`, `ProjectedPCE.strictly_differentiates_of_rank_lt` | `machine_verified_definition`; `machine_verified_theorem` | action-projection refinement |
| ACT-006 | Primary projected action selection | Maximizer predicate for action-calibrated projected PCE | `ProjectedPCE.selectsProjectedAction`, `ProjectedPCE.selected_has_max_projectedPCE` | `machine_verified_definition`; `machine_verified_theorem` | action-projection refinement |
| ACT-007 | General projection compatibility layer | Compatibility names over the primary `ProjectMap α Act`; no second primitive projection structure; active application modules use direct names where proof-stable | `GeneralProjectMap`, `generalProjectedProfile`, `generalFutureMSI`, `generalFutureMSIContents`, `generalProjectedProfile_eq_projectedProfile`, `generalFutureMSI_eq_futureMSI`, `generalFutureMSIContents_eq_futureMSIContents` | `compatibility_alias`; `machine_verified_definition`; `compatibility_theorem` | v0.4.1 compatibility; direct API cleanup v0 |
| ACT-008 | General projected PCE compatibility | Compatibility wrapper for primary `ProjectedPCE` | `GeneralProjectedPCE`, `generalProjectedPCE_eq_projectedPCE`, `GeneralProjectedPCE.*` | `compatibility_alias`; `compatibility_theorem`; `machine_verified_theorem` | v0.4.1 compatibility |
| ACT-009 | General projected action selection compatibility | Older-branch selection names retained over `ProjectedPCE` semantics | `GeneralProjectedPCE.selectsGeneralProjectedAction`, `GeneralProjectedPCE.selected_has_max_generalProjectedPCE` | `compatibility_alias`; `machine_verified_theorem` | v0.4.1 compatibility |
| AGY-001 | Agency context | Feasible action model with direct `ProjectMap α Act` projected-PCE calibration and reusable no-action feasibility | `FeasibilityModel`, `AgencyContext`, `AgencyContext.feasible`, `AgencyContext.noAction_feasible`, `AgencyContext.mkFromFeasible` | `machine_verified_structure`; `machine_verified_definition`; `machine_verified_theorem`; `primitive_structure_field` | agency layer |
| AGY-002 | Feasible projected-PCE selection | Feasible selected action maximizing projected PCE among feasible alternatives, with direct `ProjectedPCE` bridge | `feasibleProjectedPCE`, `feasibleProjectedPCE_eq_projectedPCE`, `selectsFeasibleAction`, `AgencyWitness`, `witness_of_selectsFeasibleAction`, `selectsFeasibleAction_of_witness` | `machine_verified_definition`; `machine_verified_structure`; `machine_verified_theorem` | agency layer |
| AGY-003 | Live alternatives | Nontrivial feasible action difference | `liveAlternative`, `hasLiveAlternatives`, `exists_distinct_feasible_of_hasLiveAlternatives` | `machine_verified_definition`; `machine_verified_theorem` | agency layer |
| AGY-004 | PCE-differentiated alternatives | Feasible alternatives with different projected-PCE values | `pceDifferentiatedAlternative`, `not_exists_feasible_strictly_higher_of_selects`, `pceDifferentiatedAlternative_of_selected_strictly_beats` | `machine_verified_definition`; `machine_verified_theorem` | agency layer |
| AGY-005 | Finite feasible maximizer existence | Finset-enumerated, finite-set, and fintype finite feasible-action sufficient conditions | `exists_selectsFeasibleAction_of_finset`, `exists_selectsFeasibleAction_of_finite_feasible`, `exists_selectsFeasibleAction_of_fintype` | `machine_verified_theorem` | agency layer |
| FWL-001 | Branch profile and branch contents | Deterministic projected branch profile and lifted future MSI contents, with direct projected-profile/future-MSI contents bridges | `branchProfile`, `branchProfile_eq_projectedProfile`, `branchFutureContents`, `branchFutureContents_eq_futureMSIContents`, `openAlternatives` | `machine_verified_definition`; `machine_verified_theorem` | free-will layer |
| FWL-002 | Branch-distinct free-will witness | Selected feasible agency plus live feasible branch-distinct alternative | `FreeWillWitness`, `branchDistinctAlternative`, `FreeWillWitness.hasLiveAlternatives`, `FreeWillWitness.exists_distinct_feasible`, `FreeWillWitness.branchDistinctAlternative` | `machine_verified_structure`; `machine_verified_definition`; `machine_verified_theorem` | free-will layer |
| FWL-003 | PCE-free-will witness | PCE-differentiated witness implying branch-distinct free will | `PCEFreeWillWitness`, `pceBranchDistinctAlternative`, `branchFutureContents_ne_of_pce_ne`, `PCEFreeWillWitness.toFreeWillWitness`, `freeWillWitness_of_pceFreeWillWitness` | `machine_verified_structure`; `machine_verified_definition`; `machine_verified_theorem` | free-will layer |
| FWL-004 | No free will under collapse | Branch/PCE collapse exclusions for witness types | `no_freeWillWitness_of_all_branch_contents_equal`, `no_pceFreeWillWitness_of_all_branch_contents_equal`, `no_pceFreeWillWitness_of_all_pce_equal` | `machine_verified_theorem` | free-will layer |
| TMP-001 | Temporal profile trajectory | Natural-time indexed profile sequence and action schedule | `ProfileTrajectory`, `ActionSchedule` | `machine_verified_structure` | temporal-trajectory layer |
| TMP-002 | Deterministic generated trajectory | Predicate verifying that a supplied trajectory follows deterministic projection, with named generated-step, future-content, and one-step branch-distance unfold helpers | `generatedBy`, `generatedBy_step`, `generatedBy_step_projectedProfile`, `trajectoryFutureContents`, `trajectoryFutureContents_eq_branchFutureContents`, `trajectoryFutureContents_eq_futureMSIContents`, `oneStepBranch`, `oneStepBranchUnionDistance`, `oneStepBranchUnionDistance_eq_dInfUnion` | `machine_verified_definition`; `machine_verified_theorem` | temporal-trajectory layer |
| TMP-003 | Stepwise temporal stability | Adjacent profile distances, basic union-distance bounds, uniform/eventual stability predicates, and later-start/uniform-to-eventual bridges | `stepUnionDistance`, `stepUnionDistance_nonneg`, `stepUnionDistance_le_one`, `stepSharedDistance`, `unionStepStable`, `unionStepStable_step_le`, `eventuallyUnionStepStable`, `eventuallyUnionStepStable_of_le_start`, `eventuallyUnionStepStable_of_unionStepStable` | `machine_verified_definition`; `machine_verified_theorem` | temporal-trajectory layer |
| TMP-004 | Branch-sensitive temporal divergence | Supplied trajectory divergence and free-will one-step branch divergence bridges | `DivergentTrajectories`, `freeWillWitness_live_branch_contents_distinct`, `freeWillWitness_oneStep_branch_contents_distinct`, `pceFreeWillWitness_oneStep_branch_contents_distinct` | `machine_verified_structure`; `machine_verified_theorem` | temporal-trajectory layer |
| TMP-005 | Deferred temporal enrichments | Stochastic trajectory, phenomenological duration, richer temporal continuity metric | `stochasticTrajectory_deferred`, `phenomenologicalDuration_deferred`, `temporalContinuityMetric_deferred` | `deferred_marker_not_theorem` | temporal-trajectory layer |
| AFF-001 | Relative projected-PCE valence | Baseline-relative support, defeat, and neutrality predicates | `relativePCEDelta`, `pceSupportive`, `pceNeutral`, `pceDefeating`, `pceSupportive_iff`, `pceNeutral_iff`, `pceDefeating_iff`, `pceValence_trichotomy` | `machine_verified_definition`; `machine_verified_theorem` | differentiated-affect layer |
| AFF-002 | Branch-profile shift | Distance and equality-based branch profile shift, branch union-distance bounds and metric-style helpers, plus future-content/profile bridge | `branchUnionDistance`, `branchUnionDistance_nonneg`, `branchUnionDistance_le_one`, `branchUnionDistance_self`, `branchUnionDistance_symm`, `branchUnionDistance_triangle`, `branchSharedDistance`, `branchProfileShift`, `branchFutureContents_eq_of_branchProfile_eq`, `branchProfile_ne_of_branchFutureContents_ne` | `machine_verified_definition`; `machine_verified_theorem` | differentiated-affect layer |
| AFF-003 | Affect-kernel witnesses | Feasible-action witness structures for PCE valence, profile shift, generic affect kernel, and support non-neutrality | `PCESupportAffectWitness`, `PCEDefeatAffectWitness`, `PCENeutralAffectWitness`, `pceSupportAffectWitness_pce_ne`, `ProfileShiftAffectWitness`, `AffectKernelWitness` | `machine_verified_structure`; `machine_verified_theorem` | differentiated-affect layer |
| AFF-004 | Witness bridges into affect kernel | Support/defeat/profile-shift/free-will bridges into the affect kernel | `affectKernel_of_pceSupport`, `affectKernel_of_pceDefeat`, `affectKernel_of_profileShift`, `profileShiftAffectWitness_of_freeWillWitness`, `affectKernel_of_freeWillWitness`, `affectKernel_of_pceFreeWillWitness` | `machine_verified_definition` | differentiated-affect layer |
| AFF-005 | Affect-kernel collapse exclusion | Equal branch profiles and equal projected PCE values rule out generic affect kernels | `no_affectKernel_of_branch_and_pce_collapse` | `machine_verified_theorem` | differentiated-affect layer |
| AFF-006 | Temporal affect-intensity bridge | Adjacent union distance as a naming bridge for future affect intensity, with nonnegativity, stability, and unit bounds | `temporalAffectIntensity`, `temporalAffectIntensity_nonneg`, `temporalAffectIntensity_le_of_unionStepStable`, `temporalAffectIntensity_le_one` | `machine_verified_definition`; `machine_verified_theorem` | differentiated-affect layer |
| AFF-007 | Deferred affect enrichments | Named taxonomy, love extension, substrate pathway, source-opacity pathway | `namedAffectTaxonomy_deferred`, `loveConstitutiveExtension_deferred`, `substrateAffectPathway_deferred`, `sourceOpacityAffect_deferred` | `deferred_marker_not_theorem` | differentiated-affect layer |
| RCX-DEFERRED | Religiously charged experience | High-salience transformation/attractor structure remains prose-only and not Lean-ready | none | `prose_only_unformalized`; `application_deferred` | religiously charged experience paper pending prose/math refinement |

`RCX-DEFERRED` is intentionally not a Lean module. The source paper still needs prose/math refinement around charged vs sacred terminology, source opacity, positive/negative/ambivalent transformations, high-salience attractor structure, relation to affect and temporal transformation, and avoiding theological overcommitment.

Direct API cleanup status: active agency, free-will, temporal, and affect
modules use `ProjectMap α Act`, `ProjectedPCE`, `projectedProfile`,
`futureMSI`, and `futureMSIContents` where proof-stable. Remaining
`GeneralProjectMap`, `GeneralProjectedPCE`, and `general*` declarations are
compatibility-only declarations in `TLICA.GeneralActionProjection`.

### Foundation layer

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| FND-001 | Coefficient field `K` | Linearly ordered field with distinguished positive infinitesimal `δ` | `KField`, `KField.δ`, `δ_pos`, `δ_lt_one`, `δ_lt_rat` | `machine_verified_structure`; `primitive_structure_field` | `00_signature.md` §0.3 |
| FND-002 | Positive infinitesimal `δ` | Element `δ : K` with `0 < δ`, `δ < 1`, and non-Archimedean smallness | `KField.δ` and fields | `machine_verified_structure`; `primitive_structure_field` | `00_signature.md` §0.3 |
| FND-003 | Integration relation bound | Strict quotient inequality for positive denominator | `strict_rho_bound`, `strict_quotient_bound_field`, `rho_nonneg` | `machine_verified_theorem` | `02_graph_theory.md` §2.4 |
| FND-004 | Cogito φ-value | Distinguished maximal coordinate value | `phiCogito` | `machine_verified_theorem` | `00_signature.md` §0.6 |
| FND-005 | Tier-3 φ-coordinate | Formula for non-cogito Tier-3 coordinate | `phiTier3` | `machine_verified_theorem` | `03_coordinates.md` §3.3.3 |
| FND-006 | φ-admissibility | Domain predicate/axiom restricting valid φ-values | `PhiAdmissibility` | `machine_verified_structure`; `primitive_structure_field` | `00_signature.md` §0.14 |
| FND-007 | Tier-3 strictness | Strict inequality below cogito supremum | `Tier3Strictness`, `phi_tier3_lt_phiCogito` | `machine_verified_theorem` | `03_coordinates.md` §3.3.6 |
| FND-008 | Cogito as unique φ-supremum | Unique maximal element of φ-coordinate among admissible contents | `cogito_unique_phi_supremum` | `machine_verified_theorem` | `03_coordinates.md` §3.3.6 |
| FND-009 | Admissible φ-domain repair | Proper domain `D_φ` with repaired non-reducibility witness | `DPhi`, `two_delta_minus_real_in_DPhi` | `machine_verified_theorem` | `06_independence_lemmas.md` §6.5 |
| FND-010 | Scalar mode aggregation | Infinite weighted sum bounded in `[0,1]` and strict off cogito | `mode_aggregation_summable`, `mode_aggregation_nonneg`, `mode_aggregation_le_one`, `mode_aggregation_lt_one` | `machine_verified_theorem` | `02_graph_theory.md` §2.5 |
| FND-011 | Uniform convergence of mode aggregation | Weierstrass M-test for mode series | `mode_aggregation_uniform_convergent` | `machine_verified_theorem` | `05_dynamics.md` §5.7 |
| FND-012 | Coordinate non-reducibility | No coordinate is a function of the other two in general | `CoordinateTriple`, `no_F_rho`, `no_F_phi`, `no_F_kappa`, `formal_non_reducibility` | `machine_verified_theorem` | `06_independence_lemmas.md` §§6.2-6.5 |

### Profile-comparison layer

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| PRF-001 | Scalar profile | Partial/nonnegative bounded scalar function over a domain | `ScalarProfile` | `machine_verified_definition` | `profile_comparison_v0_2.md` §4-§5 |
| PRF-002 | Zero extension | Extension of partial profile to ambient union by zero | `ScalarProfile.zeroExtend` | `machine_verified_definition` | `profile_comparison_v0_2.md` §5.2bis.1 |
| PRF-003 | Union L∞ distance | Supremum/extended distance over union domain | `dInfUnion`, `dInfUnion_nonneg`, `dInfUnion_symm`, `dInfUnion_self`, `dInfUnion_triangle` | `machine_verified_theorem` | `profile_comparison_v0_2.md` §5.2bis |
| PRF-004 | Shared-domain L∞ distance | Extended distance over intersection/shared subdomain, with bridge-domain qualified triangle inequality | `dInfShared`, `dInfShared_*`, `dInfShared_triangle_of_bridge` | `machine_verified_definition`; `machine_verified_theorem` | `profile_comparison_v0_2.md` §5.1-§5.2 |
| PRF-005 | Shell thresholds | Ordered thresholds, interior and seven-shell boundary-aware shell predicates, endpoint functions, endpoint-bound helper, shell membership bounds, and simple interior shell-distance facts | `ShellThresholds`, `shellOf`, `interiorShellIndexDistance`, `interiorShellIndexDistance_self`, `interiorShellIndexDistance_symm`, `ShellIndex7`, `shellLowerEndpoint`, `shellUpperEndpoint`, `shellEndpointBound`, `shellOf7`, `shellOf_nonneg`, `shellOf_le_one`, `shellOf7_*`, `shellEndpointBound_*` | `machine_verified_definition`; `machine_verified_theorem`; `primitive_structure_field` | `04_profiles.md` §4.3.1 |
| PRF-006 | Same/interior-shell bounds | Bound on distance for profiles in the same shell, conservative cross-interior-shell bound, boundary same-shell bounds, and profile-level pointwise/shared-distance shell bounds | `sameShellBound`, `sameShellBound_of_shellOf`, `sameInteriorShell_distance_bound`, `interiorShell_pair_bound`, `sameCogitoShell_bound`, `sameOuterShell_bound`, `shellStableDistanceBound_of_pointwise`, `dInfShared_le_shellEndpointBound_zeroExtend`, `dInfShared_le_shellEndpointBound`, `dInfShared_le_of_pointwise_shellEndpointBound`, `dInfShared_le_sameInteriorShellEndpointBound`, `shellStableDistanceVanishing_simple` | `machine_verified_theorem` | `profile_comparison_v0_2.md` §5.3 |
| PRF-007 | General shell-stratified bound | Full seven-shell pointwise bound by endpoint maximum under source-fixed shell boundary conventions, plus union-domain profile shell bounds by zero-extension and outer-shell absorption | `fullShellStratifiedBound`, `fullShellStratifiedBound_endpointBound`, `dInfUnion_le_of_pointwise`, `dInfUnion_le_of_pointwise_union`, `dInfUnion_le_shellEndpointBound_zeroExtend`, `dInfUnion_le_threeWayMax_shellEndpointBound`, `dInfUnion_le_of_pointwise_shellEndpointBound`; legacy `shellStratifiedBound_deferred` superseded | `machine_verified_theorem`; `deprecated_or_superseded` | `profile_comparison_v0_2.md` §5.3; `04_profiles.md` §4.3.1 |
| PRF-008 | Pseudo-emetric promotion | Extended pseudometric structure on profile space | `ProfileSpace`, `PseudoEMetricSpace` instance | `machine_verified_definition` | round-3/4 follow-up |

### Foundation orphan-cluster layer

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| ORP-001 | Maximally-self-defined I | Distinguished subset/structure satisfying cogito inclusion, density, threshold axioms | `MSI`, `MSI.cogito_is_supremum`, `MSI.nonCogito_has_threshold_value`, `MSI.mem_msi_positive` | `machine_verified_structure`; `primitive_structure_field` | `orphan_cluster_v0_1.md` §3 |
| ORP-002 | Preservation ranking `Π` | Preorder/ranking functional with cogito necessity and MSI maximality axioms | `PreservationRanking`, `PreservationRanking.msi_rank_max`, `PreservationRanking.no_cogito_zero_rank` | `machine_verified_structure`; `primitive_structure_field` | `orphan_cluster_v0_1.md` §4 |
| ORP-003 | Future-state projection | Deterministic transition/projection map parameterized by arbitrary action type `Act`; old wrapper and unit singleton action cases retained as degenerate defaults | `Action`, `DefaultAction`, `Action.noAction`, `ProjectMap`, `ProjectMap.noAction`, `ProjectMap.project`, `ProjectMap.noAction_projects`, `DefaultProjectMap`, `UnitDefaultProjectMap` | `machine_verified_definition`; `primitive_structure_field` | `orphan_cluster_v0_1.md` §5; v0.4/v0.4.1 refinement |
| ORP-004 | Prerogative of continued existence | Composite objective/criterion over projected future states; foundation default remains action-constant over arbitrary `Act` | `PCE`, `PCE.nonneg`, `PCE.eq_rank_msi_contents`, `PCE.bounded_by_msi_max`, `PCE.every_action_maximizes`, `PCE.all_actions_equal` | `machine_verified_theorem` | `orphan_cluster_v0_1.md` §6; v0.4 refinement |
| ORP-005 | Prerogative of consistency | Ternary consistency evaluation over contents/actions/states | `ConsistencyEval`, `ConsistencyEval.toInt`, `PtCns`, `PtCns.partition_disjoint`, `PtCns.partition_cover` | `machine_verified_structure`; `primitive_structure_field` | `orphan_cluster_v0_1.md` §7 |
| ORP-006 | Modes A/B/C | Finite mode operator selected by consistency evaluation | `ModeOp`, `ModeOp.fromEval`, `ModeOp.cogito_triggers_modeC` | `machine_verified_theorem` | `orphan_cluster_v0_1.md` §8 |
| ORP-007 | I/not-I boundary | Boundary operator separating positive from negative/non-neutral consistency classes | `IBoundary.boundary`, `IBoundary.boundary_excludes_neutral`, `IBoundary.cogito_in_boundary`, `IBoundary.mem_boundary_iff`, `IBoundary.boundary_not_neutral` | `machine_verified_theorem` | `orphan_cluster_v0_1.md` §9 |

## C. Historical ID crosswalk

The rows below are historical or superseded names only. They are not active ledger rows.

| Old ID | New ID / status | Referent | Lean declaration(s) |
|---|---|---|---|
| `ORP-008` | `ACT-001` | Future MSI model | `FutureMSIModel` |
| `ORP-008A` | `ACT-002` | Optional future-MSI profile coherence | `ProfileIso`, `CoherentFutureMSIModel` |
| `ORP-009` | `ACT-003` | Universal-domain preservation ranking | `GlobalPreservationRanking` |
| `ORP-010` | `ACT-004` | Lifted projected profile/future contents | `liftSet`, `liftMSIContents`, `projectedProfile`, `futureMSI`, `futureMSIContents` |
| `ORP-011` | `ACT-005` | Primary action-calibrated projected PCE | `ProjectedPCE` and theorem namespace |
| `ORP-012` | `ACT-006` | Primary projected action selection | `ProjectedPCE.selectsProjectedAction`, `selected_has_max_projectedPCE` |
| `ORP-013` | `ACT-007` | General projection compatibility layer | `GeneralProjectMap`, `general*` names |
| `ORP-014` | `ACT-008` | General projected PCE compatibility | `GeneralProjectedPCE`, `generalProjectedPCE_eq_projectedPCE` |
| `ORP-015` | `ACT-009` | General projected action selection compatibility | `GeneralProjectedPCE.selectsGeneralProjectedAction`, `selected_has_max_generalProjectedPCE` |
| historical `AGY-001` application target | `deprecated_or_superseded` | Broad agency target | Superseded by `AGY-001`-`AGY-005`. |
| `AGY-002` | `AGY-001` | Agency context and feasibility model | `FeasibilityModel`, `AgencyContext` |
| `AGY-003` | `AGY-002` | Feasible projected-PCE selection | `selectsFeasibleAction`, `AgencyWitness` |
| `AGY-004` | `AGY-003` | Live alternatives | `liveAlternative`, `hasLiveAlternatives` |
| `AGY-005` | `AGY-004` | PCE-differentiated alternatives | `pceDifferentiatedAlternative` |
| `AGY-006` | `AGY-005` | Finite feasible maximizer existence | `exists_selectsFeasibleAction_of_finset` |
| historical `FWL-001` application target | `deprecated_or_superseded` | Broad free-will target | Superseded by `FWL-001`-`FWL-004`. |
| `FWL-002` | `FWL-001` | Branch profile and branch contents | `branchProfile`, `branchFutureContents` |
| `FWL-003` | `FWL-002` | Branch-distinct free-will witness | `FreeWillWitness` |
| `FWL-004` | `FWL-003` | PCE-free-will witness | `PCEFreeWillWitness` |
| `FWL-005` | `FWL-004` | Branch/PCE collapse exclusions | `no_freeWillWitness_of_all_branch_contents_equal`, related theorems |
| historical `TMP-001` application target | `deprecated_or_superseded` | Broad temporal target | Superseded by `TMP-001`-`TMP-005`. |
| `TMP-002` | `TMP-001` | Indexed trajectories and schedules | `ProfileTrajectory`, `ActionSchedule` |
| `TMP-003` | `TMP-002` | Deterministic generated trajectory predicate | `generatedBy`, `trajectoryFutureContents` |
| `TMP-004` | `TMP-003` | Stepwise temporal stability | `stepUnionDistance`, `unionStepStable`, related definitions |
| `TMP-005` | `TMP-004` | Branch-sensitive temporal divergence | `DivergentTrajectories`, bridge theorems |
| `TMP-006` | `TMP-005` | Deferred temporal enrichments | `stochasticTrajectory_deferred`, related markers |
| historical `AFF-001` application target | `deprecated_or_superseded` | Broad affect target | Superseded by `AFF-001`-`AFF-007`. |
| `AFF-002` | `AFF-001` | Baseline-relative PCE valence | `relativePCEDelta`, `pceSupportive`, `pceDefeating`, `pceNeutral` |
| `AFF-003` | `AFF-002` | Branch-profile shift | `branchProfileShift`, branch-profile bridge theorems |
| `AFF-004` | `AFF-003` | Affect witness structures | `PCESupportAffectWitness`, `AffectKernelWitness`, related structures |
| `AFF-005` | `AFF-004` | Bridges into affect kernel | `affectKernel_of_*` definitions |
| `AFF-006` | `AFF-005` | Affect-kernel collapse exclusion | `no_affectKernel_of_branch_and_pce_collapse` |
| `AFF-007` | `AFF-006` | Temporal affect-intensity bridge | `temporalAffectIntensity`, related theorems |
| `AFF-008` | `AFF-007` | Deferred named/pathway affect work | `namedAffectTaxonomy_deferred`, related markers |
| `RCX-001` | `RCX-DEFERRED` | Religiously charged experience | No Lean declaration; prose-only and not Lean-ready. |

## D. Deferred/prose-only application targets

These should be added only after the foundation layer compiles and the mathematical signatures are stable.

| ID | Paper | Candidate pure math object | Lean target status |
|---|---|---|---|
| TMP-DEFERRED | Temporal phenomenology beyond deterministic substrate | Phenomenological duration and stochastic trajectory structure | `application_deferred`; deterministic substrate is normalized as `TMP-001`-`TMP-004` |
| AGY-DEFERRED | Agency semantics beyond feasible projected-PCE selection | Richer application semantics over interpretation/prediction/social layers | `application_deferred`; first structural witness layer is normalized as `AGY-001`-`AGY-004` |
| FWL-DEFERRED | Free-will metaphysics beyond branch-sensitive witnesses | Incompatibilist/compatibilist and stochastic semantics | `application_deferred`; first structural witness layer is normalized as `FWL-001`-`FWL-004` |
| AFF-DEFERRED | Named affect taxonomy and non-profile/PCE pathways | Love/grief/fear/etc., substrate pathways, source opacity | `application_deferred`; profile/PCE kernel is normalized as `AFF-001`-`AFF-006` |
| RCX-DEFERRED | Religiously charged experience | High-salience transformation/attractor pattern over identity-correlation structure | `prose_only_unformalized`; `application_deferred` |

## Codex expansion task

For every new Lean declaration:

1. Add an entry to this ledger.
2. Add or update the corresponding entry in `MAPPING.md`.
3. Mark proof status precisely.
4. If the object is application-deferred, specify which foundation objects it depends on.
