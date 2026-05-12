# Merge Readiness - v0.4

## Checkpoint

- Current base branch: `codex/tlica-source-alignment-v0_4`
- Current audit branch: `codex/tlica-v0_4-completeness-and-release-audit`
- Checkpoint name: v0.4 mathematical checkpoint

## Verification Status

- Build status: inherited base branch passed `lake build`; final branch must pass `lake build` before merge.
- Audit status: inherited base branch passed `bash scripts/audit_lean.sh`; final branch must pass the same audit before merge.
- No `sorry` status: required by `scripts/audit_lean.sh`.
- No `admit` status: required by `scripts/audit_lean.sh`.
- No global axiom status: required by `scripts/audit_lean.sh`.

## Lean Modules In Scope

The v0.4 checkpoint covers the imported TLICA modules under:

- `TLICA/Basic.lean`, `IntegrationGraph.lean`, `PhiCoordinate.lean`, `ModeAggregation.lean`, `Dynamics.lean`, `NonReducibility.lean`
- `TLICA/Profile.lean` and `TLICA/ProfileComparison/*`
- `TLICA/MSI.lean`, `PreservationRanking.lean`, `ProjectMap.lean`, `PCE.lean`, `PtCns.lean`, `Modes.lean`, `IBoundary.lean`
- `TLICA/ActionProjection.lean`, `ProfileIso.lean`, `GeneralActionProjection.lean`
- `TLICA/Agency.lean`, `FreeWill.lean`, `TemporalTrajectory.lean`, `DifferentiatedAffect.lean`

No religious-experience Lean module is in scope.

## Application Kernels Formalized

- Agency: first structural witness layer over feasible projected-PCE selection.
- Free will: branch-distinct and PCE-differentiated witness layers with collapse exclusions.
- Temporal trajectory: deterministic supplied-trajectory substrate with step-distance stability predicates and branch-divergence bridges.
- Differentiated affect: profile/PCE affect kernel with relative valence, branch profile shift, witness bridges, collapse exclusion, and temporal-intensity naming bridge.

These kernels do not assert global existence of agency, free will, affect, or trajectory.

## Compatibility Layers

- `ProjectMap α Act` is the primary deterministic projection structure.
- `ProjectedPCE` is the primary action-sensitive continuation appraisal.
- `GeneralProjectMap`, `GeneralProjectedPCE`, and `general*` names are compatibility only.
- `Action α` is the old singleton wrapper.
- `DefaultAction α := Unit` is the direct unit default carrier.

## Deferred Items

- Full shell-stratified bound.
- Finite feasible-action maximizer theorem.
- Stochastic trajectory/projection.
- Phenomenological duration.
- Richer temporal-continuity metric.
- Named affect taxonomy.
- Love as constitutive extension.
- Substrate affect pathways.
- Source-opacity affect.

## RCX-DEFERRED Status

Religiously charged experience remains `RCX-DEFERRED`: prose-only,
unformalized, and requiring source refinement before Lean. No Lean declaration
or module is added for religiously charged experience.

## Known Limitations

- The checkpoint is mathematically valuable but incomplete.
- Several primitive assumptions are structure fields, not lower-level theorems.
- Some modules still use compatibility names because the v0.4.1 action-carrier repair preserved API continuity.
- Existing build output includes warning-only duplicate-namespace and unused-variable lints.

## Recommendation

Merge-ready if final `lake build` and `bash scripts/audit_lean.sh` pass on
`codex/tlica-v0_4-completeness-and-release-audit`.

This is not a claim that all TLICA features are mathematically explained. It is
a release-readiness audit for a verified foundation spine and first application
kernels.
