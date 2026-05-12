# 1. Build status.

`lake exe cache get` completed successfully after fetching/unpacking mathlib dependencies.

Initial `lake build` failed in:

- `TLICA.PreservationRanking`: Category 2 syntax/scope issue from using `Π` as a binder name.
- `TLICA.ProfileComparison.PseudoEMetric`: Category 2 computability annotation issue for the `EDist` instance.
- `TLICA.PCE`: Category 2 syntax/scope issue from using `Π` as a binder name.

Fixes applied:

- Renamed Lean binders from `Π` to `pi`.
- Marked the standalone `EDist` instance as `noncomputable`.

Final build status: `lake build` succeeds. Remaining output is warnings only, primarily duplicate-namespace lints and unused variables in deterministic default definitions.

Audit status: `bash scripts/audit_lean.sh` succeeds. No `sorry`, `admit`, or global `axiom` declarations were found in imported Lean files.

# 2. Files changed.

- `.gitignore`
- `TLICA/PreservationRanking.lean`
- `TLICA/ProfileComparison/PseudoEMetric.lean`
- `TLICA/PCE.lean`
- `TLICA/PtCns.lean`
- `TLICA/IBoundary.lean`
- `MAPPING.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `build_logs/lake_build_initial.log`
- `build_logs/audit_initial.log`
- `build_logs/lake_build_after_fix_1.log`
- `build_logs/lake_build_after_fix_2.log`
- `build_logs/lake_build_after_expansion.log`
- `build_logs/lake_build_after_expansion_fix_1.log`

# 3. Lean declarations added/modified.

Modified for compilation:

- `TLICA.PreservationRanking.PreservationRanking.msi_rank_max`
- `TLICA.PreservationRanking.PreservationRanking.no_cogito_zero_rank`
- `TLICA.ProfileComparison.PseudoEMetric.instEDistProfileSpace`
- `TLICA.PCE.PCE`
- `TLICA.PCE.PCE.nonneg`
- `TLICA.PCE.PCE.bounded_by_msi_max`
- `TLICA.PCE.PCE.selectsAction`
- `TLICA.PCE.PCE.every_action_maximizes`

Added and machine-verified:

- `TLICA.PtCns.PtCns.partition_cover`
- `TLICA.IBoundary.mem_boundary_iff`
- `TLICA.IBoundary.boundary_not_neutral`
- `TLICA.PCE.PCE.eq_rank_msi_contents`
- `TLICA.PCE.PCE.all_actions_equal`

# 4. Rosetta entries added/modified.

- Updated `MAPPING.md` to mark the verified round-4 compile status and add the new PtCns, boundary, and PCE default-model lemmas.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` statuses from `encoded_pending_compile` to `machine_verified` where the local build now verifies them.
- Updated `ROSETTA_PURE_MATH_VIEW.md` with the deterministic PCE constant-value fact and the PtCns partition/boundary facts.
- Updated `ROSETTA_BRIDGE_VIEW.md` with machine-verified orphan-cluster bridge statuses and the new Lean declarations.

# 5. Open mathematical issues requiring user/ChatGPT review.

- The general shell-stratified bound remains deferred as `shellStratifiedBound_TODO`; only the same-shell case is machine-verified.
- The shared-domain qualified triangle theorem for `dInfShared` is still not encoded.
- The deterministic foundation default for `PCE` is intentionally constant across actions. Differentiated action choice requires an application-calibrated projection/ranking refinement rather than a foundation theorem.
- `IBoundary.contestableBoundary` is currently definitionally equal to `boundary`; a refined contestability boundary needs additional source-grounded structure before Lean should encode stronger claims.
