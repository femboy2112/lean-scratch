# Lean Verification Report

## 1. Branch scope

- Base branch: `codex/tlica-p1-lean-improvement-batch-v0`
- Current branch: `codex/tlica-shell-stratified-bound-v0`

This branch addresses the shell-stratified-bound target conservatively. It adds
machine-verified interior-shell and profile-level pointwise bound infrastructure
while keeping the full seven-shell theorem deferred until boundary-shell
semantics are source-fixed.

It does not add religious-experience formalization, named affect taxonomy,
stochastic projection, or phenomenological duration.

## 2. Inherited branch verification

Commands run before branching:

- `git fetch --all`: succeeded.
- `git checkout codex/tlica-p1-lean-improvement-batch-v0`: succeeded.
- `git pull`: already up to date.
- `lake build`: succeeded, with existing warning-only duplicate-namespace and
  unused-variable lints outside this branch's touched module.
- `bash scripts/audit_lean.sh`: succeeded.

## 3. Completed theorem work

Lean source changed:

- `TLICA/ProfileComparison/ShellRefinement.lean`

New declarations:

- `interiorShellIndexDistance`
- `shellOf_nonneg`
- `shellOf_le_one`
- `sameInteriorShell_distance_bound`
- `interiorShell_pair_bound`
- `shellStableDistanceBound_of_pointwise`

Existing declarations retained:

- `sameShellBound`
- `sameShellBound_of_shellOf`
- `shellStableDistanceVanishing_simple`
- `shellStratifiedBound_deferred`

## 4. Blocked theorem target

The full seven-shell theorem remains deferred as
`shellStratifiedBound_deferred`.

Exact blocker: the current Lean convention defines only five interior
half-open shells over `Fin 5`, using the intervals `[r_(i+1), r_i)`.
The prose-level full bound needs explicit conventions for shell 0 (cogito),
shell 6 (outer), endpoint inclusivity, and how the shell-distance term treats
boundary shells. Those conventions are not encoded as definitions or structure
fields, so this branch does not state the full theorem as proved.

## 5. Documentation updated

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`

## 6. Current branch verification

- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`: succeeded.
- `lake exe cache get`: succeeded; no files to download.
- Final `lake build`: succeeded, with existing warning-only duplicate-namespace
  and unused-variable lints outside this branch's touched module.
- Final `bash scripts/audit_lean.sh`: succeeded.

Audit target:

- Zero `sorry` in imported Lean files.
- Zero `admit` in imported Lean files.
- Zero global `axiom` declarations in imported Lean files.

## 7. Next recommended branch

Recommended next branch:

`codex/tlica-full-shell-bound-boundary-conventions`

Purpose: add a source-grounded boundary-augmented shell convention, then replace
or strengthen `shellStratifiedBound_deferred` only under those explicit fields
or definitions.
