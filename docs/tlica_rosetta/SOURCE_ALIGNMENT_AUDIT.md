# Source Alignment Audit

This audit records how the formalized application layers relate to the current source papers and working papers. It is intentionally conservative: it distinguishes source-backed kernels from application claims that remain deferred pending prose/math refinement.

Alignment classifications:

- directly source-backed
- source-backed but strengthened
- source-backed but narrowed
- formal convenience / compatibility
- deferred pending prose revision

| Layer | Alignment | Lean/Rosetta coverage | Source alignment note |
|---|---|---|---|
| Action projection | source-backed but strengthened | `ACT-001` to `ACT-006`; `ProjectMap α Act`; `ProjectedPCE` | The orphan-cluster projection/PCE apparatus motivates deterministic projection and preservation ranking. v0.4 strengthened the foundation by parameterizing `ProjectMap` over arbitrary `Act`, replacing the old singleton-like default as the primary projection API. |
| General action compatibility | formal convenience / compatibility | `ACT-007` to `ACT-009`; `GeneralProjectMap`, `GeneralProjectedPCE`, `general*` names | Retained only for older branch continuity. There is one primitive deterministic projection structure: `ProjectMap α Act`. |
| Agency | source-backed but narrowed | `AGY-001` to `AGY-005` | Formalized as feasible projected-PCE selection with live alternatives and PCE-differentiated alternatives. This is a first structural witness layer, not a full account of all agency semantics. |
| Free will | source-backed but narrowed | `FWL-001` to `FWL-004` | Formalized as branch-sensitive feasible agency with a selected action and live branch-distinct alternative. PCE-free-will witnesses imply free-will witnesses. Broader compatibilist/incompatibilist metaphysics and stochastic projection are deferred. |
| Temporal trajectory | source-backed but narrowed | `TMP-001` to `TMP-005` | Formalized as deterministic natural-time indexed profile trajectories supplied as data and verified by `generatedBy`. Phenomenological duration and stochastic trajectories remain deferred. |
| Differentiated affect | source-backed but narrowed | `AFF-001` to `AFF-007` | Formalized only as a profile/PCE affect kernel: baseline-relative PCE support/defeat/neutrality, branch profile shift, affect-kernel witnesses, and collapse exclusion. Named affect taxonomy, substrate pathway, and source-opacity pathway remain deferred. |
| Religious charged experience | deferred pending prose revision | `RCX-DEFERRED` | No Lean module is added. The paper still needs prose/math refinement around charged vs sacred terminology, source opacity, positive/negative/ambivalent transformations, high-salience attractor structure, relation to affect and temporal transformation, and avoiding theological overcommitment. |

## Boundary Notes

- `FutureMSIModel + GlobalPreservationRanking` remain the rank/projection bridge that held up across agency, free-will, temporal, and affect layers.
- `ProfileIso` and `CoherentFutureMSIModel` are optional stronger coherence tools; the weak `FutureMSIModel.domain_match` condition remains the default.
- `FeasibilityModel` is the reusable no-action-feasibility structure.
- No global existence of agency, free will, trajectories, affect kernels, or religiously charged experience is asserted.
- Stochastic projection remains deferred.
