# Release Summary - v0.4

v0.4 fixed the action-carrier defect by parameterizing deterministic projection
as `ProjectMap α Act`.

`ProjectedPCE` is now the primary action-sensitive continuation appraisal over
parameterized project maps. The foundation-default `PCE` remains action-constant
and is useful as a baseline foundation object, not as the action-differentiating
application score.

`GeneralProjectMap` and `GeneralProjectedPCE` are compatibility only. They are
retained so older branch names and downstream references continue to typecheck,
but they are not a second primitive projection/PCE architecture.

`ProfileIso` and `CoherentFutureMSIModel` are optional coherence tools. The weak
default future model remains `FutureMSIModel`, whose key compatibility condition
is `domain_match`.

`FeasibilityModel` provides reusable no-action feasibility. Agency contexts can
carry arbitrary feasible-action predicates while preserving the guarantee that
the project map's `noAction` remains feasible.

Agency, free will, temporal trajectory, and differentiated affect now have first
structural kernels/witness layers:

- Agency has feasible projected-PCE selection predicates and `AgencyWitness`.
- Free will has branch-distinct and PCE-differentiated witness structures, plus collapse exclusions.
- Temporal trajectory has deterministic supplied trajectories, schedules, step distances, stability predicates, and branch-divergence bridges.
- Differentiated affect has a profile/PCE affect kernel with relative PCE valence, branch profile shift, generic affect witnesses, collapse exclusion, and temporal-intensity naming.

No global existence of agency, free will, affect, or trajectory is asserted.
Existence claims appear only as supplied witnesses or explicit hypotheses.

Religiously charged experience remains `RCX-DEFERRED`. There is no religious
experience Lean module, and no religious-experience formalization is claimed in
v0.4.
