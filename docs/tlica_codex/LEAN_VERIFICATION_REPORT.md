# Lean Verification Report

## 1. Branch scope

- Base branch: `codex/tlica-shell-stratified-bound-v0`
- Current branch: `codex/tlica-shell-boundary-conventions-v0`

This branch resolves the source-level shell boundary convention blocker and
continues with low-risk theorem wrappers in agency, temporal trajectories, and
branch distances. It also audits contestable-boundary readiness without adding
new boundary theory.

It does not add religious-experience formalization, named affect taxonomy,
stochastic projection, phenomenological duration, or theological/religious
formalization.

## 2. Inherited branch verification

Commands run before branching:

- `git fetch --all`: succeeded.
- `git checkout codex/tlica-shell-stratified-bound-v0`: succeeded.
- `git pull`: already up to date.
- `lake build`: succeeded, with existing warning-only lints.
- `bash scripts/audit_lean.sh`: succeeded.

## 3. Completed phases

- Shell source convention audit: completed in
  `docs/tlica_rosetta/SHELL_BOUNDARY_CONVENTION_AUDIT.md`.
- Boundary-aware shell Lean encoding: completed additively in
  `TLICA/ProfileComparison/ShellRefinement.lean`.
- Full pointwise shell-stratified bound: proved as `fullShellStratifiedBound`.
- Agency finite-selection strengthening: added finite-set and fintype wrappers.
- Direct ProjectedPCE API audit: added `feasibleProjectedPCE_eq_projectedPCE`.
- Generated trajectory helper lemmas: added named generated-step helpers.
- Branch-distance helper expansion: added reflexivity, symmetry, and triangle.
- Contestable boundary audit: completed in
  `docs/tlica_rosetta/CONTESTABLE_BOUNDARY_AUDIT.md`.
- Matrix, backlog, coverage, ledger, mapping, and inventory docs updated.

## 4. Theorem names added

Shell refinement:

- `ShellIndex7`
- `shellLowerEndpoint`
- `shellUpperEndpoint`
- `shellOf7`
- `shellOf7_lower_le`
- `shellOf7_le_upper`
- `shellOf7_mem_Icc_zero_one`
- `shellOf7_cogito_value`
- `shellOf7_outer_bound`
- `sameCogitoShell_bound`
- `sameOuterShell_bound`
- `abs_sub_le_max_endpoint_abs`
- `fullShellStratifiedBound`

Agency:

- `feasibleProjectedPCE_eq_projectedPCE`
- `exists_selectsFeasibleAction_of_finite_feasible`
- `exists_selectsFeasibleAction_of_fintype`

Temporal trajectory:

- `generatedBy_step`
- `generatedBy_step_projectedProfile`
- `trajectoryFutureContents_eq_branchFutureContents`

Differentiated affect:

- `branchUnionDistance_self`
- `branchUnionDistance_symm`
- `branchUnionDistance_triangle`

## 5. Blocked or skipped phases

- The source-level shell boundary blocker is resolved: conventions are
  source-fixed in `04_profiles.md` and `profile_comparison_v0_2.md`.
- The remaining shell work is profile-level packaging, not boundary semantics:
  choose whether the next exported theorem should target `dInfShared`,
  `dInfUnion`, or another profile-level shell assignment form.
- Contestable boundary remains source-ambiguous. The audit classifies current
  `contestableBoundary` as a stub equal to `boundary`; no new Lean theory was
  added because the source has not chosen among perturbation sensitivity, Mode
  A/C dual candidacy, projection-induced class change, or temporal instability.

## 6. Files changed

Lean source:

- `TLICA/ProfileComparison/ShellRefinement.lean`
- `TLICA/Agency.lean`
- `TLICA/TemporalTrajectory.lean`
- `TLICA/DifferentiatedAffect.lean`

Documentation and inventory:

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/SHELL_BOUNDARY_CONVENTION_AUDIT.md`
- `docs/tlica_rosetta/CONTESTABLE_BOUNDARY_AUDIT.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`

## 7. Verification status

- `lake exe cache get`: succeeded.
- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`: succeeded.
- Final `lake build`: succeeded, with existing warning-only lints.
- Final `bash scripts/audit_lean.sh`: succeeded.

Audit target:

- Zero `sorry` in imported Lean files.
- Zero `admit` in imported Lean files.
- Zero global `axiom` declarations in imported Lean files.

## 8. Next recommended branch

Recommended next branch:

`codex/tlica-profile-shell-bound-corollary`

Purpose: package `fullShellStratifiedBound` into the chosen profile-level
distance statement, probably using `shellStableDistanceBound_of_pointwise` once
the shared-domain or union-domain hypothesis shape is fixed.
