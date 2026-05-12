# 1. Build status.

Baseline `lake build` on branch `codex/tlica-differentiated-affect-v0` succeeded before v0.4 foundation-refinement edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After the v0.4 foundation refinement, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA/ProjectMap.lean`
- `TLICA/PCE.lean`
- `TLICA/ProfileIso.lean`
- `TLICA/ActionProjection.lean`
- `TLICA/GeneralActionProjection.lean`
- `TLICA/Agency.lean`
- `TLICA/FreeWill.lean`
- `TLICA.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`

# 3. Inherited application stack confirmed before editing.

- `TLICA.ActionProjection`
- `TLICA.GeneralActionProjection`
- `TLICA.Agency`
- `TLICA.FreeWill`
- `TLICA.TemporalTrajectory`
- `TLICA.DifferentiatedAffect`

# 4. Foundation refinements.

Application pressure revealed that singleton `Action α` was too weak. The primitive deterministic projection structure is now:

- `TLICA.ProjectMap.ProjectMap (α Act : Type*)`
- `TLICA.ProjectMap.ProjectMap.noAction`
- `TLICA.ProjectMap.ProjectMap.project`
- `TLICA.ProjectMap.ProjectMap.identity_action_natural`

The old singleton/default action case is preserved:

- `TLICA.ProjectMap.Action`
- `TLICA.ProjectMap.Action.noAction`
- `TLICA.ProjectMap.DefaultAction`
- `TLICA.ProjectMap.DefaultProjectMap`

`TLICA.GeneralActionProjection.GeneralProjectMap` is retained only as a compatibility abbreviation for `ProjectMap α Act`; there is no duplicate primitive deterministic projection structure.

The deterministic foundation-default `TLICA.PCE.PCE` is now parameterized over arbitrary `Act`, and its constant-action theorems still hold:

- `TLICA.PCE.PCE.nonneg`
- `TLICA.PCE.PCE.eq_rank_msi_contents`
- `TLICA.PCE.PCE.bounded_by_msi_max`
- `TLICA.PCE.PCE.every_action_maximizes`
- `TLICA.PCE.PCE.all_actions_equal`

# 5. Coherence and feasibility additions.

Added optional profile-coherence layer:

- `TLICA.ProfileIso.ProfileIso`
- `TLICA.ProfileIso.ProfileIso.refl`
- `TLICA.ProfileIso.ProfileIso.symm`
- `TLICA.ProfileIso.ProfileIso.trans`
- `TLICA.ActionProjection.CoherentFutureMSIModel`
- `TLICA.ActionProjection.CoherentFutureMSIModel.toFutureMSIModel`

Existing `FutureMSIModel.domain_match` remains the default weak compatibility condition. The optional coherent model projects to the weaker model.

Added reusable no-action feasibility:

- `TLICA.Agency.FeasibilityModel`
- `TLICA.Agency.FeasibilityModel.feasible`
- `TLICA.Agency.FeasibilityModel.noAction_feasible`
- `TLICA.Agency.AgencyContext.feasibility`
- `TLICA.Agency.AgencyContext.feasible`
- `TLICA.Agency.AgencyContext.noAction_feasible`

# 6. Application stack preservation.

The following meanings remain intact:

- `GeneralProjectedPCE` still supports arbitrary `Act`.
- `selectsFeasibleAction` still quantifies over feasible actions.
- `FreeWillWitness` still uses branch-sensitive agency.
- `PCEFreeWillWitness` still implies `FreeWillWitness`.
- `AffectKernelWitness` still receives bridges from `FreeWillWitness` and `PCEFreeWillWitness`.

`FutureMSIModel + GlobalPreservationRanking` held up across agency, free-will, temporal, and differentiated-affect layers.

# 7. Rosetta entries added/modified.

- Updated `MAPPING.md` with parameterized `ProjectMap`, compatibility `GeneralProjectMap`, `ProfileIso`, `CoherentFutureMSIModel`, and `FeasibilityModel`.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with v0.4 projection, coherence, projected-PCE, and feasibility refinements.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to state that the singleton action design was too weak and is now a degenerate default.
- Updated `ROSETTA_BRIDGE_VIEW.md` with compatibility-layer and no-duplicate-primitive-projection notes.
- Regenerated `lean_declaration_inventory.md`.

# 8. Open mathematical issues requiring user/ChatGPT review.

- No global existence of agency, free will, trajectory, or affect is asserted.
- Stochastic projection remains deferred.
- `GeneralActionProjection` remains as compatibility names, not as a second primitive projection structure.
- `ProfileIso` is optional stronger coherence; `FutureMSIModel.domain_match` remains the default weak condition.
