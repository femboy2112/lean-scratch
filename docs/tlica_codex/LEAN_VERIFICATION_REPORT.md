# 1. Build status.

Baseline `lake build` on branch `codex/tlica-general-action-space-v0` succeeded before edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After adding the generalized action-space projected-PCE layer, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA.lean`
- `TLICA/GeneralActionProjection.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`

# 3. Lean declarations added/modified.

Added and machine-verified:

- `TLICA.GeneralActionProjection.GeneralProjectMap`
- `TLICA.GeneralActionProjection.GeneralProjectMap.noAction`
- `TLICA.GeneralActionProjection.GeneralProjectMap.project`
- `TLICA.GeneralActionProjection.GeneralProjectMap.identity_action_natural`
- `TLICA.GeneralActionProjection.generalProjectMapOfProjectMap`
- `TLICA.GeneralActionProjection.generalProjectedProfile`
- `TLICA.GeneralActionProjection.generalFutureMSI`
- `TLICA.GeneralActionProjection.generalFutureMSIContents`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE.nonneg`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE.eq_of_future_contents_eq`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE.ge_of_rank_ge`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE.monotone_of_future_contents_subset`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE.selectsGeneralProjectedAction`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE.selected_has_max_generalProjectedPCE`
- `TLICA.GeneralActionProjection.GeneralProjectedPCE.strictly_differentiates_of_rank_lt`
- `TLICA.GeneralActionProjection.generalProjectedPCE_strictly_differentiates_of_rank_lt`

Modified:

- `TLICA.lean` now imports `TLICA.GeneralActionProjection`.

Preserved:

- Existing `TLICA.ProjectMap.ProjectMap` is unchanged.
- Existing `TLICA.ActionProjection.ProjectedPCE` is unchanged.
- Existing deterministic foundation `TLICA.PCE.PCE` is unchanged and remains intentionally constant across foundation actions.

# 4. Rosetta entries added/modified.

- Updated `MAPPING.md` with a generalized action-space projected-PCE section.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with `GeneralProjectMap`, `GeneralProjectedPCE`, generalized projected action selection, and conditional strict differentiation entries.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to state that `ProjectedPCE` is an interface over singleton-like `Action α`, while `GeneralProjectedPCE` is the application-ready arbitrary-action layer.
- Updated `ROSETTA_BRIDGE_VIEW.md` with bridge rows for generalized action-space projected PCE, the old-to-general projection embedding, and deferred stochastic projection.

# 5. Open mathematical issues requiring user/ChatGPT review.

- Existing `Action α` is singleton-like because it stores only `Unit`; agency/free-will formalization should use `GeneralActionProjection` with an application-supplied action type `Act`.
- `GeneralProjectMap.identity_action_natural` is a primitive structure-field assumption for the generalized deterministic projection layer.
- `FutureMSIModel` and `GlobalPreservationRanking` remain calibration structures; their compatibility and ranking fields are not proved from the foundation.
- Strict action differentiation remains conditional on a supplied strict global-rank inequality. No existence of differentiating actions is asserted by the foundation.
- Stochastic projection remains deferred.
