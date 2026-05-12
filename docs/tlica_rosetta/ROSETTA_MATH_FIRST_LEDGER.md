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
| FND-011 | Uniform convergence of mode aggregation | Weierstrass M-test for mode series | `mode_aggregation_uniform_convergent` | machine_verified per handoff / verify locally | `05_dynamics.md` §5.7 |
| FND-012 | Coordinate non-reducibility | No coordinate is a function of the other two in general | `CoordinateTriple`, `no_F_rho`, `no_F_phi`, `no_F_kappa`, `formal_non_reducibility` | machine_verified | `06_independence_lemmas.md` §§6.2-6.5 |

## Profile-comparison layer

| ID | TLICA referent | Pure math referent | Lean declaration(s) | Status | Source |
|---|---|---|---|---|---|
| PRF-001 | Scalar profile | Partial/nonnegative bounded scalar function over a domain | `ScalarProfile` | machine_verified | `profile_comparison_v0_2.md` §4-§5 |
| PRF-002 | Zero extension | Extension of partial profile to ambient union by zero | `ScalarProfile.zeroExtend` | machine_verified | `profile_comparison_v0_2.md` §5.2bis.1 |
| PRF-003 | Union L∞ distance | Supremum/extended distance over union domain | `dInfUnion`, `dInfUnion_nonneg`, `dInfUnion_symm`, `dInfUnion_self`, `dInfUnion_triangle` | machine_verified | `profile_comparison_v0_2.md` §5.2bis |
| PRF-004 | Shared-domain L∞ distance | Extended distance over intersection/shared subdomain | `dInfShared`, `dInfShared_*` | machine_verified | `profile_comparison_v0_2.md` §5.1-§5.2 |
| PRF-005 | Shell thresholds | Ordered thresholds partitioning profile values into shells | `ShellThresholds`, `shellOf` | machine_verified | `04_profiles.md` §4.3.1 |
| PRF-006 | Same-shell bound | Bound on distance for profiles in the same shell | `sameShellBound` | machine_verified | `profile_comparison_v0_2.md` §5.3 |
| PRF-007 | General shell-stratified bound | Bound by maximum shell gap and shell distance | `shellStratifiedBound_TODO` | theorem_skeleton_nonimported / round-5 target | `profile_comparison_v0_2.md` §5.3 |
| PRF-008 | Pseudo-emetric promotion | Extended pseudometric structure on profile space | `ProfileSpace`, `PseudoEMetricSpace` instance | machine_verified | round-3/4 follow-up |

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

## Application signature targets

These should be added only after the foundation layer compiles and the mathematical signatures are stable.

| ID | Paper | Candidate pure math object | Lean target status |
|---|---|---|---|
| TMP-001 | Temporal phenomenology | Indexed transition/duration structure over profile states | application_deferred |
| AGY-001 | Agency | Action-selection structure constrained by projection, preservation ranking, and consistency | application_deferred |
| FWL-001 | Free will | Family of admissible action branches modulo identity-preservation constraints | application_deferred |
| AFF-001 | Differentiated affect | Valenced profile-difference / appraisal functional | application_deferred |
| RCX-001 | Religiously charged experience | High-salience transformation/attractor pattern over identity-correlation structure | application_deferred |

## Codex expansion task

For every new Lean declaration:

1. Add an entry to this ledger.
2. Add or update the corresponding entry in `MAPPING.md`.
3. Mark proof status precisely.
4. If the object is application-deferred, specify which foundation objects it depends on.
