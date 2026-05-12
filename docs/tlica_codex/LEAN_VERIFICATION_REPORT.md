# 1. Build status.

Baseline `lake build` on branch `codex/tlica-free-will-v1` succeeded before edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After tightening the free-will witness layer, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA/FreeWill.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`

# 3. Lean declarations added/modified.

Added and machine-verified:

- `TLICA.FreeWill.branchFutureContents_ne_of_pce_ne`
- `TLICA.FreeWill.branchDistinctAlternative_of_pceBranchDistinctAlternative`
- `TLICA.FreeWill.PCEFreeWillWitness.toFreeWillWitness`
- `TLICA.FreeWill.PCEFreeWillWitness.hasLiveAlternatives`
- `TLICA.FreeWill.freeWillWitness_of_pceFreeWillWitness`
- `TLICA.FreeWill.no_pceFreeWillWitness_of_all_branch_contents_equal`
- `TLICA.FreeWill.no_pceFreeWillWitness_of_all_pce_equal`
- `TLICA.FreeWill.freeWillWitness_of_selected_strictly_beats`

Preserved:

- Existing `TLICA.FreeWill` definitions are unchanged.
- Existing `TLICA.Agency`, `TLICA.GeneralActionProjection`, `TLICA.ActionProjection`, `TLICA.PCE`, and `TLICA.ProjectMap` modules are unchanged.

# 4. Rosetta entries added/modified.

- Updated `MAPPING.md` to record that PCE-differentiated free will is machine-verified as stronger than branch-distinct free will.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with the new stronger-than and collapse theorems.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to state that projected-PCE value difference implies branch future content difference.
- Updated `ROSETTA_BRIDGE_VIEW.md` with branch/PCE collapse exclusions.
- Regenerated `lean_declaration_inventory.md`.

# 5. Open mathematical issues requiring user/ChatGPT review.

- Free will is still not asserted globally. The layer remains a structural witness theory over agency.
- Branch collapse excludes both `FreeWillWitness` and `PCEFreeWillWitness`.
- PCE collapse excludes `PCEFreeWillWitness`.
- Stochastic projection remains deferred.
- Metaphysical incompatibilism/compatibilism claims remain unencoded.
