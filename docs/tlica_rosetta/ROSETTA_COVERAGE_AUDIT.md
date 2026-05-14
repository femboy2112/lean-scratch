# Rosetta Coverage Audit

This file audits the Rosetta-to-Lean direction after foundation v0.4.1 consolidation and Rosetta normalization. Active application rows use normalized IDs; historical application IDs are crosswalk-only.

Coverage classifications:

- has Lean declaration
- has multiple Lean declarations
- deferred marker only
- prose-only / not ready for Lean
- historical / superseded by normalization

| Rosetta ID | Rosetta object | Coverage classification | Lean coverage | Notes |
|---|---|---|---|---|
| FND-001 | Coefficient field | has multiple Lean declarations | `KField`, field projections, `δ_lt_half` | Primitive assumptions are structure fields. |
| FND-002 | Positive infinitesimal | has multiple Lean declarations | `KField.δ`, positivity/smallness fields | Structure-field assumptions, not proved from lower axioms. |
| FND-003 | Integration relation bound | has multiple Lean declarations | `strict_rho_bound`, `strict_quotient_bound_field`, `rho_nonneg` | Machine-verified theorem family. |
| FND-004 to FND-009 | φ-coordinate/cogito apparatus | has multiple Lean declarations | `phiCogito`, `phiTier3`, `PhiAdmissibility`, `Tier3Strictness`, `cogito_unique_phi_supremum`, `DPhi` | Includes primitive admissibility fields and derived theorems. |
| FND-010 to FND-011 | Mode aggregation | has multiple Lean declarations | `mode_aggregation_*`, `mode_aggregation_uniform_convergent` | Machine-verified theorem families. |
| FND-012 | Coordinate non-reducibility | has multiple Lean declarations | `CoordinateTriple`, witness definitions, `no_F_*`, `formal_non_reducibility` | Witness definitions are internal proof data. |
| PRF-001 to PRF-004 | Scalar profile and profile distances | has multiple Lean declarations | `ScalarProfile`, `zeroExtend`, `dInfUnion`, `dInfShared` | Profile comparison layer. |
| PRF-005 to PRF-006 | Shell thresholds and interior/same-shell/shared-profile bounds | has multiple Lean declarations | `ShellThresholds`, `shellOf`, `interiorShellIndexDistance`, `interiorShellIndexDistance_self`, `interiorShellIndexDistance_symm`, `ShellIndex7`, `shellOf7`, `shellEndpointBound`, `sameShellBound*`, `sameInteriorShell_distance_bound`, `interiorShell_pair_bound`, `sameCogitoShell_bound`, `sameOuterShell_bound`, `shellStableDistanceBound_of_pointwise`, `dInfShared_le_shellEndpointBound*`, `dInfShared_le_of_pointwise_shellEndpointBound` | Machine-verified interior and source-fixed boundary shell definitions/theorems plus shared-domain profile shell corollaries. |
| PRF-007 | Full seven-shell shell-stratified bound | has multiple Lean declarations | `fullShellStratifiedBound`, `fullShellStratifiedBound_endpointBound`, `dInfUnion_le_of_pointwise`, `dInfUnion_le_of_pointwise_union`, `dInfUnion_le_shellEndpointBound_zeroExtend`, `dInfUnion_le_threeWayMax_shellEndpointBound`, `dInfUnion_le_of_pointwise_shellEndpointBound`; legacy `shellStratifiedBound_deferred` | Full pointwise bound and union-domain profile shell bounds are machine-verified; legacy marker is superseded. |
| PRF-008 | Pseudo-emetric profile space | has multiple Lean declarations | `ProfileSpace`, `edist_def` | Profile-comparison convenience layer. |
| ORP-001 | MSI | has multiple Lean declarations | `MSI`, `MSI.*` | Primitive fields plus derived theorems. |
| ORP-002 | Preservation ranking | has multiple Lean declarations | `PreservationRanking`, theorem namespace | Primitive fields plus derived theorems. |
| ORP-003 | Deterministic projection | has multiple Lean declarations | `ProjectMap`, `Action`, `DefaultAction`, `DefaultProjectMap`, `UnitDefaultProjectMap`, `noAction_projects` | `ProjectMap α Act` is primary; singleton defaults are degenerate compatibility. |
| ORP-004 | Foundation-default PCE | has multiple Lean declarations | `PCE`, `PCE.*` | Action-constant over arbitrary `Act`; action sensitivity lives in `ProjectedPCE`. |
| ORP-005 to ORP-007 | Consistency, modes, boundary | has multiple Lean declarations | `PtCns`, `ModeOp`, `IBoundary` families | Foundation orphan-cluster coverage. |
| historical ORP-008 to ORP-015 | Action/projection application refinements | historical / superseded by normalization | See `ACT-001` to `ACT-009` | Historical IDs retained in crosswalk only, not active Rosetta rows. |
| ACT-001 | Future MSI model | has Lean declaration | `FutureMSIModel` | Weak `domain_match` remains default. |
| ACT-002 | Optional future-MSI profile coherence | has multiple Lean declarations | `ProfileIso`, `CoherentFutureMSIModel`, bridge and transport theorems | Optional stronger coherence, not forced downstream. |
| ACT-003 | Global preservation ranking | has Lean declaration | `GlobalPreservationRanking` | Rank/projection bridge. |
| ACT-004 | Lifted future contents | has multiple Lean declarations | `liftSet`, `liftMSIContents`, `projectedProfile`, `futureMSI`, `futureMSIContents` | Direct `ProjectMap α Act` API. |
| ACT-005 | Primary `ProjectedPCE` | has multiple Lean declarations | `ProjectedPCE`, theorem namespace | Primary application-ready projected-PCE definition. |
| ACT-006 | Primary projected action selection | has multiple Lean declarations | `selectsProjectedAction`, `selected_has_max_projectedPCE` | Maximizer predicate, no existence theorem. |
| ACT-007 to ACT-009 | General action compatibility | has multiple Lean declarations | `GeneralProjectMap`, `GeneralProjectedPCE`, `general*` names | Compatibility only; no second primitive projection structure; active modules use direct names where proof-stable. |
| AGY-001 to AGY-005 | Agency witness layer and finite feasible maximizer existence | has multiple Lean declarations | `FeasibilityModel`, `AgencyContext`, `selectsFeasibleAction`, `AgencyWitness`, live/PCE-differentiated predicates, finite-selection wrappers | First structural witness layer over direct `ProjectMap α Act` / `ProjectedPCE` plus finset, finite-set, and fintype feasible selection theorems; no unrestricted global agency existence. |
| FWL-001 to FWL-004 | Free-will witness layer | has multiple Lean declarations | direct branch definitions, projected-profile/future-MSI bridge theorems, `FreeWillWitness`, `PCEFreeWillWitness`, collapse theorems | First structural branch-sensitive witness layer. |
| TMP-001 to TMP-004 | Deterministic temporal trajectory substrate | has multiple Lean declarations | `ProfileTrajectory`, `ActionSchedule`, direct `generatedBy`, generated-step helpers, future-content bridges, stability/divergence declarations, step and one-step branch-distance bounds | Supplied/verified trajectories only; no global trajectory existence. |
| TMP-005 | Temporal enrichments | deferred marker only | `stochasticTrajectory_deferred`, `phenomenologicalDuration_deferred`, `temporalContinuityMetric_deferred` | Markers, not theorem claims. |
| AFF-001 to AFF-006 | Profile/PCE affect kernel | has multiple Lean declarations | PCE valence, branch shift and branch-distance bounds/metric-style helpers, affect witness, bridge, collapse, intensity declarations | Generic kernel only, not named affect taxonomy. |
| AFF-007 | Named/pathway affect enrichments | deferred marker only | `namedAffectTaxonomy_deferred`, `loveConstitutiveExtension_deferred`, `substrateAffectPathway_deferred`, `sourceOpacityAffect_deferred` | Markers, not theorem claims. |
| RCX-DEFERRED | Religiously charged experience | prose-only / not ready for Lean | none | Deferred pending prose/math refinement around charged vs sacred terminology, source opacity, positive/negative/ambivalent transformations, attractor structure, affect/temporal relation, and theological non-overcommitment. |

## Compatibility Normalization

- `ProjectMap α Act` is the primary deterministic projection structure.
- `ProjectedPCE` is the primary projected-PCE definition.
- `GeneralProjectMap`, `GeneralProjectedPCE`, and `general*` names are compatibility-only.
- Active agency, free-will, temporal, and affect modules use direct `ProjectMap α Act`, `ProjectedPCE`, `projectedProfile`, and `futureMSIContents` names where proof-stable.
- `Action α` is the old singleton wrapper default.
- `DefaultAction α := Unit` is the direct unit degenerate carrier.
- `DefaultProjectMap` and `UnitDefaultProjectMap` are degenerate/default compatibility forms.
