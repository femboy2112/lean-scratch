# 1. Build status.

Baseline `lake build` on branch `codex/tlica-math-rosetta-v1` succeeded before edits.

Baseline `bash scripts/audit_lean.sh` succeeded:

- no `sorry` in imported Lean files,
- no `admit` in imported Lean files,
- no global `axiom` declarations in imported Lean files.

After the math-first cleanup, `lake build` succeeds. Remaining output is warning-only, mostly existing duplicate-namespace lints and deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA/ProfileComparison/Pointwise.lean`
- `TLICA/ProfileComparison/ShellRefinement.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`

# 3. Lean declarations added/modified.

Added and machine-verified:

- `TLICA.ProfileComparison.Pointwise.dInfShared_triangle_of_bridge`
- `TLICA.ProfileComparison.ShellRefinement.shellOf`
- `TLICA.ProfileComparison.ShellRefinement.sameShellBound_of_shellOf`

Modified:

- `TLICA.ProfileComparison.ShellRefinement.shellStableDistanceVanishing_simple` now uses `shellOf` in its hypotheses.

Demoted:

- Removed theorem `TLICA.ProfileComparison.ShellRefinement.shellStratifiedBound_TODO`, whose conclusion was only `True`.
- Added `TLICA.ProfileComparison.ShellRefinement.shellStratifiedBound_deferred` as an explicit non-substantive deferred target marker. It is not counted as a machine-verified theorem.

# 4. Rosetta entries added/modified.

- Updated `MAPPING.md` to record `dInfShared_triangle_of_bridge`, `shellOf`, `sameShellBound_of_shellOf`, and the deferred status of the general shell-stratified bound.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` to distinguish machine-verified definitions, machine-verified theorems, primitive structure-field assumptions, and deferred target markers.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to include the bridge-domain shared triangle theorem and remove overclaiming around the general shell-stratified bound.
- Updated `ROSETTA_BRIDGE_VIEW.md` to replace `shellStratifiedBound_TODO` with `shellStratifiedBound_deferred` and mark it as deferred only.

# 5. Open mathematical issues requiring user/ChatGPT review.

- The full general shell-stratified bound remains deferred. The current Lean foundation verifies the interior same-shell case; boundary shells 0 and 6 need explicit source-grounded conventions before a stronger theorem should be stated.
- `IBoundary.contestableBoundary` remains definitionally equal to `boundary`; a refined contestability boundary still needs additional structure.
- The deterministic foundation default for `PCE` remains constant across actions. Differentiated action choice belongs in an application-calibrated projection/ranking refinement.
