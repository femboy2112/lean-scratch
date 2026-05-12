# Rosetta Bridge View — Seed

This document records the mapping relation. Codex should expand it as Lean coverage expands.

| Bridge ID | TLICA expression | Pure math expression | Lean declaration(s) | Status |
|---|---|---|---|---|
| B-FND-001 | `K`, infinitesimal `δ` | Ordered non-Archimedean coefficient field with distinguished infinitesimal | `KField` | machine_verified / primitive field |
| B-FND-002 | Cogito φ-supremum | Distinguished point with unique maximal coordinate | `cogito_unique_phi_supremum` | machine_verified |
| B-FND-003 | Mode aggregation | Summable nonnegative weighted series with bounds | `mode_aggregation_*` | machine_verified |
| B-FND-004 | Coordinate non-reducibility | No coordinate projection factors through the other two in general | `formal_non_reducibility` | machine_verified |
| B-PRF-001 | Scalar profile comparison | Extended sup-distance over union/shared domains, with bridge-domain shared triangle inequality | `dInfUnion`, `dInfShared`, `dInfShared_triangle_of_bridge` | machine_verified definitions/theorems |
| B-PRF-002 | Shell stability | Interior-shell predicate and same-shell threshold bound | `shellOf`, `sameShellBound`, `sameShellBound_of_shellOf`, `shellStableDistanceVanishing_simple`, `shellStratifiedBound_deferred` | partial: same-shell machine_verified; general bound deferred marker only |
| B-ORP-001 | Maximally self-defined I | Distinguished subset/substructure with inclusion/density axioms | `MSI`, `MSI.*` | machine_verified / primitive fields |
| B-ORP-002 | Preservation ranking | Ranking functional/order with preservation axioms | `PreservationRanking`, `PreservationRanking.msi_rank_max`, `PreservationRanking.no_cogito_zero_rank` | machine_verified / primitive fields |
| B-ORP-003 | Future projection | Action-indexed transition map | `ProjectMap`, `ProjectMap.noAction_projects` | machine_verified / primitive field |
| B-ORP-004 | Continued existence prerogative | Composite nonnegative objective criterion; constant in deterministic foundation default | `PCE`, `PCE.eq_rank_msi_contents`, `PCE.all_actions_equal` | machine_verified |
| B-ORP-005 | Consistency prerogative | Ternary evaluation and induced operator selection; disjoint exhaustive partition | `PtCns`, `PtCns.partition_disjoint`, `PtCns.partition_cover`, `ModeOp` | machine_verified / primitive field |
| B-ORP-006 | I/not-I boundary | Boundary subset induced by positive-or-negative evaluation classes | `IBoundary`, `IBoundary.mem_boundary_iff`, `IBoundary.boundary_not_neutral` | machine_verified |
| B-ORP-007 | Foundation-action projected PCE interface | Deterministic projected profile plus future MSI assignment plus universal-domain ranking over singleton-like `Action α` | `FutureMSIModel`, `GlobalPreservationRanking`, `ProjectedPCE` | machine_verified definitions/theorems; interface layer over current foundation action type |
| B-ORP-008 | General action-space projected PCE | Same projected-PCE construction over arbitrary application action type `Act` | `GeneralProjectMap`, `GeneralProjectedPCE` | machine_verified definitions/theorems; recommended for agency/free-will formalization |
| B-ORP-009 | Conditional action differentiation | Strict projected-PCE difference follows from strict global-rank difference; no foundation-level existence claim | `GeneralProjectedPCE.strictly_differentiates_of_rank_lt`, `generalProjectedPCE_strictly_differentiates_of_rank_lt` | machine_verified conditional theorem |
| B-ORP-010 | Foundation projection embedding | Existing `ProjectMap α` embeds into generalized action-space projection over `Action α` | `generalProjectMapOfProjectMap` | machine_verified definition |
| B-ORP-011 | Stochastic projected PCE | Probability-valued or expected projected future profile/rank model | none | application_deferred |
