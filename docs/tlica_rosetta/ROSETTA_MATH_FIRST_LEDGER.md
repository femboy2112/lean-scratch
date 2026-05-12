# Rosetta Math-First Ledger — Seed v0.0

This ledger starts from the round-4 Lean handoff and should be expanded by Codex. It is not the final Rosetta stone. It is the math-first working ledger.

## Foundation layer

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| FND-001 | Coefficient field `K` | Linearly ordered field with distinguished positive infinitesimal `δ` | `KField`, `KField.δ`, `δ_pos`, `δ_lt_one`, `δ_lt_rat` | machine_verified / primitive_axiom_field | `00_signature.md` §0.3 |
| FND-002 | Positive infinitesimal `δ` | Element `δ : K` with `0 < δ`, `δ < 1`, and non-Archimedean smallness | `KField.δ` and fields | machine_verified / primitive_axiom_field | `00_signature.md` §0.3 |
| FND-003 | Integration relation bound | Strict quotient inequality for positive denominator | `strict_rho_bound`, `strict_quotient_bound_field`, `rho_nonneg` | machine_verified | `02_graph_theory.md` §2.4 |
| FND-004 | Cogito φ-value | Distinguished maximal coordinate value | `phiCogito` | machine_verified | `00_signature.md` §0.6 |
| FND-005 | Tier-3 φ-coordinate | Formula for non-cogito Tier-3 coordinate | `phiTier3` | machine_verified | `03_coordinates.md` §3.3.3 |
| FND-006 | φ-admissibility | Domain predicate/axiom restricting valid φ-values | `PhiAdmissibility` | machine_verified / primitive_axiom_field | `00_signature.md` §0.14 |
| FND-007 | Tier-3 strictness | Strict inequality below cogito supremum | `Tier3Strictness`, `phi_tier3_lt_phiCogito` | machine_verified | `03_coordinates.md` §3.3.6 |
| FND-008 | Cogito as unique φ-supremum | Unique maximal element of φ-coordinate among admissible contents | `cogito_unique_phi_supremum` | machine_verified | `03_coordinates.md` §3.3.6 |
| FND-009 | Admissible φ-domain repair | Proper domain `D_φ` with repaired non-reducibility witness | `DPhi`, `two_delta_minus_real_in_DPhi` | machine_verified | `06_independence_lemmas.md` §6.5 |
| FND-010 | Scalar mode aggregation | Infinite weighted sum bounded in `[0,1]` and strict off cogito | `mode_aggregation_summable`, `mode_aggregation_nonneg`, `mode_aggregation_le_one`, `mode_aggregation_lt_one` | machine_verified | `02_graph_theory.md` §2.5 |
| FND-011 | Uniform convergence of mode aggregation | Weierstrass M-test for mode series | `mode_aggregation_uniform_convergent` | machine_verified theorem | `05_dynamics.md` §5.7 |
| FND-012 | Coordinate non-reducibility | No coordinate is a function of the other two in general | `CoordinateTriple`, `no_F_rho`, `no_F_phi`, `no_F_kappa`, `formal_non_reducibility` | machine_verified | `06_independence_lemmas.md` §§6.2-6.5 |

## Profile-comparison layer

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| PRF-001 | Scalar profile | Partial/nonnegative bounded scalar function over a domain | `ScalarProfile` | machine_verified definition | `profile_comparison_v0_2.md` §4-§5 |
| PRF-002 | Zero extension | Extension of partial profile to ambient union by zero | `ScalarProfile.zeroExtend` | machine_verified definition | `profile_comparison_v0_2.md` §5.2bis.1 |
| PRF-003 | Union L∞ distance | Supremum/extended distance over union domain | `dInfUnion`, `dInfUnion_nonneg`, `dInfUnion_symm`, `dInfUnion_self`, `dInfUnion_triangle` | machine_verified | `profile_comparison_v0_2.md` §5.2bis |
| PRF-004 | Shared-domain L∞ distance | Extended distance over intersection/shared subdomain, with bridge-domain qualified triangle inequality | `dInfShared`, `dInfShared_*`, `dInfShared_triangle_of_bridge` | machine_verified definition/theorems | `profile_comparison_v0_2.md` §5.1-§5.2 |
| PRF-005 | Shell thresholds | Ordered thresholds and interior half-open shell-membership predicate | `ShellThresholds`, `shellOf` | machine_verified definitions / primitive structure fields | `04_profiles.md` §4.3.1 |
| PRF-006 | Same-shell bound | Bound on distance for profiles in the same shell | `sameShellBound`, `sameShellBound_of_shellOf`, `shellStableDistanceVanishing_simple` | machine_verified theorems | `profile_comparison_v0_2.md` §5.3 |
| PRF-007 | General shell-stratified bound | Bound by maximum shell gap and shell distance | `shellStratifiedBound_deferred` | deferred target marker; not a verified theorem | `profile_comparison_v0_2.md` §5.3 |
| PRF-008 | Pseudo-emetric promotion | Extended pseudometric structure on profile space | `ProfileSpace`, `PseudoEMetricSpace` instance | machine_verified definition/instance | round-3/4 follow-up |

## Foundation orphan-cluster layer

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| ORP-001 | Maximally-self-defined I | Distinguished subset/structure satisfying cogito inclusion, density, threshold axioms | `MSI`, `MSI.cogito_is_supremum`, `MSI.nonCogito_has_threshold_value`, `MSI.mem_msi_positive` | machine_verified / primitive_axiom_field | `orphan_cluster_v0_1.md` §3 |
| ORP-002 | Preservation ranking `Π` | Preorder/ranking functional with cogito necessity and MSI maximality axioms | `PreservationRanking`, `PreservationRanking.msi_rank_max`, `PreservationRanking.no_cogito_zero_rank` | machine_verified / primitive_axiom_field | `orphan_cluster_v0_1.md` §4 |
| ORP-003 | Future-state projection | Deterministic transition/projection map under actions | `Action`, `Action.noAction`, `ProjectMap`, `ProjectMap.noAction_projects` | machine_verified / primitive_axiom_field | `orphan_cluster_v0_1.md` §5 |
| ORP-004 | Prerogative of continued existence | Composite objective/criterion over projected future states | `PCE`, `PCE.nonneg`, `PCE.eq_rank_msi_contents`, `PCE.bounded_by_msi_max`, `PCE.every_action_maximizes`, `PCE.all_actions_equal` | machine_verified | `orphan_cluster_v0_1.md` §6 |
| ORP-005 | Prerogative of consistency | Ternary consistency evaluation over contents/actions/states | `ConsistencyEval`, `ConsistencyEval.toInt`, `PtCns`, `PtCns.partition_disjoint`, `PtCns.partition_cover` | machine_verified / primitive_axiom_field | `orphan_cluster_v0_1.md` §7 |
| ORP-006 | Modes A/B/C | Finite mode operator selected by consistency evaluation | `ModeOp`, `ModeOp.fromEval`, `ModeOp.cogito_triggers_modeC` | machine_verified | `orphan_cluster_v0_1.md` §8 |
| ORP-007 | I/not-I boundary | Boundary operator separating positive from negative/non-neutral consistency classes | `IBoundary.boundary`, `IBoundary.boundary_excludes_neutral`, `IBoundary.cogito_in_boundary`, `IBoundary.mem_boundary_iff`, `IBoundary.boundary_not_neutral` | machine_verified | `orphan_cluster_v0_1.md` §9 |
| ORP-008 | Action-calibrated future MSI model | Assignment of an MSI to each deterministic projected profile, with domain compatibility | `FutureMSIModel`, `FutureMSIModel.msiOf`, `FutureMSIModel.domain_match` | machine_verified definition / primitive structure-field assumption | action-projection refinement |
| ORP-009 | Universal-domain preservation ranking | Ranking over `Set α` for comparing lifted future MSI contents across projected profiles | `GlobalPreservationRanking`, `rank_nonneg`, `monotone` | machine_verified definition / primitive structure-field assumptions | action-projection refinement |
| ORP-010 | Lifted future MSI contents | Image of subtype-domain MSI contents in the universal content type | `liftSet`, `liftMSIContents`, `projectedProfile`, `futureMSI`, `futureMSIContents` | machine_verified definitions | action-projection refinement |
| ORP-011 | Foundation-action projected PCE interface | Projected PCE over existing singleton-like `Action α` (`data : Unit`) | `ProjectedPCE`, `ProjectedPCE.nonneg`, `ProjectedPCE.eq_of_future_contents_eq`, `ProjectedPCE.ge_of_rank_ge`, `ProjectedPCE.monotone_of_future_contents_subset`, `ProjectedPCE.strictly_differentiates_of_rank_lt` | machine_verified definition/theorems; interface layer only | action-projection refinement |
| ORP-012 | Projected action selection | Maximizer predicate for action-calibrated projected PCE | `ProjectedPCE.selectsProjectedAction`, `ProjectedPCE.selected_has_max_projectedPCE` | machine_verified definition/theorem | action-projection refinement |
| ORP-013 | General deterministic action projection | Project map over arbitrary application action type `Act` | `GeneralProjectMap`, `generalProjectMapOfProjectMap` | machine_verified definition / primitive structure-field assumptions | general-action-space refinement |
| ORP-014 | General projected PCE | Application-ready projected PCE over arbitrary action type `Act` | `GeneralProjectedPCE`, `GeneralProjectedPCE.nonneg`, `GeneralProjectedPCE.eq_of_future_contents_eq`, `GeneralProjectedPCE.ge_of_rank_ge`, `GeneralProjectedPCE.monotone_of_future_contents_subset`, `GeneralProjectedPCE.strictly_differentiates_of_rank_lt`, `generalProjectedPCE_strictly_differentiates_of_rank_lt` | machine_verified definition/theorems; conditional non-degeneracy only | general-action-space refinement |
| ORP-015 | General projected action selection | Maximizer predicate for arbitrary action spaces | `GeneralProjectedPCE.selectsGeneralProjectedAction`, `GeneralProjectedPCE.selected_has_max_generalProjectedPCE` | machine_verified definition/theorem | general-action-space refinement |
| AGY-002 | Agency context | Feasible action model with generalized projected-PCE calibration | `AgencyContext`, `AgencyContext.feasible`, `AgencyContext.noAction_feasible` | machine_verified definition / primitive structure-field assumptions | agency layer |
| AGY-003 | Feasible projected PCE selection | Selection among feasible alternatives by generalized projected PCE | `feasibleProjectedPCE`, `selectsFeasibleAction`, `AgencyWitness`, `witness_of_selectsFeasibleAction`, `selectsFeasibleAction_of_witness` | machine_verified definitions/theorems; no global existence claim | agency layer |
| AGY-004 | Live alternatives | Nontrivial agency as existence of distinct feasible actions | `liveAlternative`, `hasLiveAlternatives`, `exists_distinct_feasible_of_hasLiveAlternatives` | machine_verified definitions/theorem | agency layer |
| AGY-005 | PCE-differentiated alternatives | Feasible alternatives with different generalized projected-PCE values | `pceDifferentiatedAlternative`, `not_exists_feasible_strictly_higher_of_selects`, `pceDifferentiatedAlternative_of_selected_strictly_beats` | machine_verified definitions/theorems | agency layer |
| AGY-006 | Finite feasible maximizer existence | Future finite-action sufficient condition for maximizer existence | `finiteFeasibleSelection_deferred` | deferred target marker; not a verified theorem | agency layer |
| FWL-002 | Branch profile and branch contents | Deterministic projected branch profile and lifted future MSI contents | `branchProfile`, `branchFutureContents`, `openAlternatives` | machine_verified definitions | free-will layer |
| FWL-003 | Branch-distinct free-will witness | Selected agency plus live alternative with distinct future branch contents | `FreeWillWitness`, `branchDistinctAlternative`, `FreeWillWitness.hasLiveAlternatives`, `FreeWillWitness.exists_distinct_feasible`, `FreeWillWitness.branchDistinctAlternative` | machine_verified definition/theorems; no global existence claim | free-will layer |
| FWL-004 | PCE-differentiated free-will witness | Stronger witness with live alternative whose projected-PCE value differs | `PCEFreeWillWitness`, `pceBranchDistinctAlternative`, `branchFutureContents_ne_of_pce_ne`, `branchDistinctAlternative_of_pceBranchDistinctAlternative`, `PCEFreeWillWitness.toFreeWillWitness`, `freeWillWitness_of_pceFreeWillWitness`, `PCEFreeWillWitness.hasLiveAlternatives`, `PCEFreeWillWitness.pceDifferentiatedAlternative`, `PCEFreeWillWitness.pceBranchDistinctAlternative`, `pceFreeWillWitness_of_selected_strictly_beats`, `freeWillWitness_of_selected_strictly_beats` | machine_verified definitions/theorems; formally stronger than branch-distinct free will | free-will layer |
| FWL-005 | No free will under branch/PCE collapse | Branch collapse excludes both free-will witness types; PCE collapse excludes PCE-free-will witnesses | `no_freeWillWitness_of_all_branch_contents_equal`, `no_pceFreeWillWitness_of_all_branch_contents_equal`, `no_pceFreeWillWitness_of_all_pce_equal` | machine_verified conditional theorems | free-will layer |
| TMP-002 | Temporal profile trajectory | Natural-time indexed sequence of scalar profiles and action schedule | `ProfileTrajectory`, `ActionSchedule` | machine_verified structures; supplied data only | temporal-trajectory layer |
| TMP-003 | Deterministic generated trajectory | Predicate that a supplied trajectory follows generalized deterministic projection under a supplied schedule | `generatedBy`, `trajectoryFutureContents`, `oneStepBranch` | machine_verified definitions; no global existence assertion | temporal-trajectory layer |
| TMP-004 | Stepwise temporal stability | Adjacent-time profile comparison using existing union/shared distances | `stepUnionDistance`, `stepSharedDistance`, `unionStepStable`, `eventuallyUnionStepStable` | machine_verified definitions | temporal-trajectory layer |
| TMP-005 | Branch-sensitive temporal divergence | Supplied trajectories with a witnessed time-indexed profile difference; free-will witnesses provide one-step branch-future divergence data | `DivergentTrajectories`, `freeWillWitness_live_branch_contents_distinct`, `freeWillWitness_oneStep_branch_contents_distinct`, `pceFreeWillWitness_oneStep_branch_contents_distinct` | machine_verified structure/conditional theorems | temporal-trajectory layer |
| TMP-006 | Deferred temporal enrichments | Stochastic trajectory, phenomenological duration, and richer temporal-continuity metric | `stochasticTrajectory_deferred`, `phenomenologicalDuration_deferred`, `temporalContinuityMetric_deferred` | deferred markers only; not theorem claims | temporal-trajectory layer |

## Application signature targets

These should be added only after the foundation layer compiles and the mathematical signatures are stable.

| ID | Paper | Candidate pure math object | Lean target status |
|---|---|---|---|
| TMP-001 | Temporal phenomenology | Indexed transition/duration structure over profile states | partially formalized by deterministic indexed profile trajectories; phenomenological duration still application_deferred |
| AGY-001 | Agency | Feasible action selection constrained by deterministic projection, future MSI model, and global preservation ranking | formalized via `AgencyContext` and `selectsFeasibleAction`; richer application semantics deferred |
| FWL-001 | Free will | Branch-sensitive agency with live feasible alternatives | first structural witness layer formalized; richer branch semantics still application_deferred |
| AFF-001 | Differentiated affect | Valenced profile-difference / appraisal functional | application_deferred; temporal profile-difference base now available |
| RCX-001 | Religiously charged experience | High-salience transformation/attractor pattern over identity-correlation structure | application_deferred |

## Codex expansion task

For every new Lean declaration:

1. Add an entry to this ledger.
2. Add or update the corresponding entry in `MAPPING.md`.
3. Mark proof status precisely.
4. If the object is application-deferred, specify which foundation objects it depends on.
