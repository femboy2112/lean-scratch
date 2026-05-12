# 1. Build status.

Baseline `lake build` on branch `codex/tlica-action-projection-v0` succeeded before edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After adding the action-calibrated projected-PCE layer, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA.lean`
- `TLICA/ActionProjection.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`

# 3. Lean declarations added/modified.

Added and machine-verified:

- `TLICA.ActionProjection.FutureMSIModel`
- `TLICA.ActionProjection.FutureMSIModel.msiOf`
- `TLICA.ActionProjection.FutureMSIModel.domain_match`
- `TLICA.ActionProjection.GlobalPreservationRanking`
- `TLICA.ActionProjection.GlobalPreservationRanking.rank`
- `TLICA.ActionProjection.GlobalPreservationRanking.rank_nonneg`
- `TLICA.ActionProjection.GlobalPreservationRanking.monotone`
- `TLICA.ActionProjection.liftSet`
- `TLICA.ActionProjection.liftMSIContents`
- `TLICA.ActionProjection.projectedProfile`
- `TLICA.ActionProjection.futureMSI`
- `TLICA.ActionProjection.futureMSIContents`
- `TLICA.ActionProjection.ProjectedPCE`
- `TLICA.ActionProjection.ProjectedPCE.nonneg`
- `TLICA.ActionProjection.ProjectedPCE.eq_of_future_contents_eq`
- `TLICA.ActionProjection.ProjectedPCE.ge_of_rank_ge`
- `TLICA.ActionProjection.ProjectedPCE.monotone_of_future_contents_subset`
- `TLICA.ActionProjection.ProjectedPCE.selectsProjectedAction`
- `TLICA.ActionProjection.ProjectedPCE.selected_has_max_projectedPCE`
- `TLICA.ActionProjection.ProjectedPCE.strictly_differentiates_of_rank_lt`

Modified:

- `TLICA.lean` now imports `TLICA.ActionProjection`.

Preserved:

- Existing `TLICA.PCE.PCE` and all deterministic foundation-default theorems are unchanged. That layer remains intentionally constant across actions.

# 4. Rosetta entries added/modified.

- Updated `MAPPING.md` with a new action-calibrated projected-PCE section.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with entries for `FutureMSIModel`, `GlobalPreservationRanking`, lifted future MSI contents, `ProjectedPCE`, projected action selection, and conditional strict differentiation.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to distinguish deterministic foundation `PCE` from action-calibrated `ProjectedPCE`.
- Updated `ROSETTA_BRIDGE_VIEW.md` with bridge rows for action-calibrated projected PCE, conditional action differentiation, and deferred stochastic projection.

# 5. Open mathematical issues requiring user/ChatGPT review.

- `FutureMSIModel` uses `domain_match` rather than full `profile_match`. This avoids dependent-subtype equality over `ScalarProfile.toFun`; it is sufficient here because projected PCE ranks lifted content sets rather than directly comparing profile functions.
- `GlobalPreservationRanking.rank_nonneg` and `GlobalPreservationRanking.monotone` are primitive calibration fields, not proved consequences of the foundation.
- Strict action differentiation is conditional on a supplied strict global-rank inequality. The foundation does not assert that differentiating actions exist.
- Stochastic projection remains deferred; this branch uses only deterministic `ProjectMap.project`.
