# Lean Verification Report

## 1. Branch scope

- Base branch: `codex/tlica-v0_4-completeness-and-release-audit`
- Current branch: `codex/tlica-p1-lean-improvement-batch-v0`

This branch converts several Lean-ready v0.4 backlog items into imported,
machine-verified Lean declarations. It does not add religious-experience
formalization, named affect taxonomy, stochastic projection, phenomenological
duration, or a new major application module.

## 2. Completed phases

- Phase 1: replaced the finite feasible-selection deferred marker with a
  finset-enumerated finite feasible-action maximizer theorem.
- Phase 2: added temporal union-step distance and stability helper lemmas.
- Phase 3: added `ProfileIso` transport helpers and coherent future-MSI model
  convenience lemmas.
- Phase 4: added branch union-distance bounds, temporal affect-intensity bound,
  and a PCE-support non-neutrality helper.
- Phase 5: cleaned touched agency comments so `ProjectedPCE`/`ProjectMap α Act`
  remain primary and `GeneralProjectedPCE`/`GeneralProjectMap` remain
  compatibility names.
- Phase 6: updated Rosetta mapping, declaration coverage, coverage audit,
  feature matrix, backlog, pure math view, and declaration inventory.

## 3. Blocked or skipped phases

- Full shell-stratified bound was skipped as requested; it remains the main
  P1 theorem target because boundary conventions should be handled in a focused
  branch.
- Raw `Set.Finite` finite feasible-selection theorem was not needed for this
  batch. The imported theorem uses an explicit nonempty `Finset Act` that
  enumerates exactly the feasible set.

## 4. Theorem names added

Agency:

- `exists_selectsFeasibleAction_of_finset`

Temporal trajectory:

- `stepUnionDistance_nonneg`
- `stepUnionDistance_le_one`
- `unionStepStable_step_le`
- `eventuallyUnionStepStable_of_le_start`
- `eventuallyUnionStepStable_of_unionStepStable`

Profile coherence / action projection:

- `ProfileIso.dom_mem_iff`
- `ProfileIso.val_eq_left`
- `ProfileIso.val_eq_right`
- `CoherentFutureMSIModel.profile_iso_to_domain_match`
- `CoherentFutureMSIModel.toFutureMSIModel_msiOf`

Differentiated affect:

- `branchUnionDistance_nonneg`
- `branchUnionDistance_le_one`
- `temporalAffectIntensity_le_one`
- `pceSupportAffectWitness_pce_ne`

## 5. Files changed

Lean source:

- `TLICA/Agency.lean`
- `TLICA/TemporalTrajectory.lean`
- `TLICA/ProfileIso.lean`
- `TLICA/ActionProjection.lean`
- `TLICA/DifferentiatedAffect.lean`

Documentation and inventory:

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`

## 6. Verification status

Inherited branch verification on `codex/tlica-v0_4-completeness-and-release-audit`:

- `git fetch --all`: succeeded.
- `git checkout codex/tlica-v0_4-completeness-and-release-audit`: succeeded.
- `git pull`: already up to date.
- `lake build`: succeeded, with existing warning-only duplicate-namespace and
  unused-variable lints.
- `bash scripts/audit_lean.sh`: succeeded.

Current branch verification:

- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`: succeeded.
- Final `lake build`: succeeded, with existing warning-only duplicate-namespace
  and unused-variable lints.
- Final `bash scripts/audit_lean.sh`: succeeded.

Audit target:

- Zero `sorry` in imported Lean files.
- Zero `admit` in imported Lean files.
- Zero global `axiom` declarations in imported Lean files.

## 7. Next recommended branch

Recommended next branch:

`codex/tlica-shell-stratified-bound`

Rationale: this batch closes the finite feasible-selection marker and several
low-risk helper targets. The remaining high-value P1 item is the full
shell-stratified bound, but it should be handled separately with explicit shell
boundary conventions.
