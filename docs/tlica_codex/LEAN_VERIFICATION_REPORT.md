# 1. Build status.

Baseline `lake build` on branch `codex/tlica-foundation-refinement-v0_4` succeeded before v0.4.1 consolidation edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After the v0.4.1 consolidation, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA/ProjectMap.lean`
- `TLICA/PCE.lean`
- `TLICA/ActionProjection.lean`
- `TLICA/GeneralActionProjection.lean`
- `TLICA/Agency.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/SOURCE_ALIGNMENT_AUDIT.md`

# 3. Consolidation summary.

v0.4.1 is a consolidation of v0.4, not a new theory layer.

Confirmed:

- The only primitive deterministic projection structure is `TLICA.ProjectMap.ProjectMap (α Act : Type*)`.
- `TLICA.GeneralActionProjection.GeneralProjectMap` is an abbreviation for `ProjectMap α Act`.
- `ProjectedPCE` is the primary application-ready projected-PCE definition over parameterized `ProjectMap α Act`.
- `GeneralProjectedPCE` is retained as a compatibility wrapper for older branch continuity.

The v0.4.1 Rosetta-normalization branch is documentation/audit-only. It adds normalized Rosetta IDs, exact status categories, declaration coverage, source-alignment audit, and `RCX-DEFERRED` as prose-only/application-deferred. It does not add a religious-experience Lean module or any new application theory.

# 4. Lean declarations added.

Default-action compatibility:

- `TLICA.ProjectMap.UnitDefaultProjectMap`

General-to-primary compatibility equalities:

- `TLICA.GeneralActionProjection.generalProjectedProfile_eq_projectedProfile`
- `TLICA.GeneralActionProjection.generalFutureMSI_eq_futureMSI`
- `TLICA.GeneralActionProjection.generalFutureMSIContents_eq_futureMSIContents`
- `TLICA.GeneralActionProjection.generalProjectedPCE_eq_projectedPCE`

Coherent model weak-domain-match bridge:

- `TLICA.ActionProjection.CoherentFutureMSIModel.toFutureMSIModel_domain_match`

Agency construction helper:

- `TLICA.Agency.AgencyContext.mkFromFeasible`

# 5. Preserved interpretations.

- The old singleton action case is preserved only as a degenerate default:
  - `Action α` is the old wrapper compatibility type.
  - `DefaultAction α := Unit` is the simplest degenerate action carrier.
  - `DefaultProjectMap` uses the old wrapper for backward compatibility.
  - `UnitDefaultProjectMap` uses the direct unit carrier.
- `PCE.all_actions_equal` is now about deterministic foundation-default PCE being action-constant over arbitrary `Act`; it is not caused by singleton action typing.
- Action-sensitive evaluation lives in `ProjectedPCE`.
- `FutureMSIModel + GlobalPreservationRanking` remain the rank/projection bridge.
- `ProfileIso` and `CoherentFutureMSIModel` are optional stronger coherence tools.
- `FeasibilityModel` remains the reusable no-action-feasibility structure.
- `ctx.feasible P` notation remains available through `AgencyContext.feasible`.

# 6. Application stack preservation.

The following meanings remain intact:

- `GeneralProjectedPCE` still supports arbitrary `Act`.
- `selectsFeasibleAction` still quantifies over feasible actions.
- `FreeWillWitness` still uses branch-sensitive agency.
- `PCEFreeWillWitness` still implies `FreeWillWitness`.
- `AffectKernelWitness` still receives bridges from `FreeWillWitness` and `PCEFreeWillWitness`.

# 7. Rosetta entries added/modified.

- Updated `MAPPING.md` with v0.4.1 compatibility equalities and direct-primary API language.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with `UnitDefaultProjectMap`, compatibility equality theorems, `toFutureMSIModel_domain_match`, and `AgencyContext.mkFromFeasible`.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to mark `ProjectedPCE` as primary and `GeneralProjectedPCE` as compatibility.
- Updated `ROSETTA_BRIDGE_VIEW.md` with v0.4.1 consolidation notes.
- Regenerated `lean_declaration_inventory.md`.

# 8. Open mathematical issues requiring user/ChatGPT review.

- No global existence of agency, free will, trajectory, or affect is asserted.
- Stochastic projection remains deferred.
- `GeneralActionProjection` remains as compatibility names, not as a second primitive projection structure.
- `FutureMSIModel.domain_match` remains the default weak condition.
