# 1. Build status.

Baseline `lake build` on branch `codex/tlica-free-will-v0` succeeded before edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After adding the free-will witness layer, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA.lean`
- `TLICA/FreeWill.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
- `docs/tlica_rosetta/lean_mapping_round4.md`

# 3. Lean declarations added/modified.

Added and machine-verified:

- `TLICA.FreeWill.branchProfile`
- `TLICA.FreeWill.branchFutureContents`
- `TLICA.FreeWill.branchDistinctAlternative`
- `TLICA.FreeWill.pceBranchDistinctAlternative`
- `TLICA.FreeWill.openAlternatives`
- `TLICA.FreeWill.FreeWillWitness`
- `TLICA.FreeWill.FreeWillWitness.selected`
- `TLICA.FreeWill.FreeWillWitness.selected_agency`
- `TLICA.FreeWill.FreeWillWitness.alternative`
- `TLICA.FreeWill.FreeWillWitness.alternative_live`
- `TLICA.FreeWill.FreeWillWitness.branch_distinct`
- `TLICA.FreeWill.PCEFreeWillWitness`
- `TLICA.FreeWill.PCEFreeWillWitness.selected`
- `TLICA.FreeWill.PCEFreeWillWitness.selected_agency`
- `TLICA.FreeWill.PCEFreeWillWitness.alternative`
- `TLICA.FreeWill.PCEFreeWillWitness.alternative_live`
- `TLICA.FreeWill.PCEFreeWillWitness.pce_distinct`
- `TLICA.FreeWill.FreeWillWitness.hasLiveAlternatives`
- `TLICA.FreeWill.FreeWillWitness.exists_distinct_feasible`
- `TLICA.FreeWill.FreeWillWitness.branchDistinctAlternative`
- `TLICA.FreeWill.PCEFreeWillWitness.pceDifferentiatedAlternative`
- `TLICA.FreeWill.PCEFreeWillWitness.pceBranchDistinctAlternative`
- `TLICA.FreeWill.pceFreeWillWitness_of_selected_strictly_beats`
- `TLICA.FreeWill.no_freeWillWitness_of_all_branch_contents_equal`

Modified:

- `TLICA.lean` now imports `TLICA.FreeWill`.

Preserved:

- Existing `TLICA.Agency` is unchanged.
- Existing `TLICA.GeneralActionProjection`, `TLICA.ActionProjection`, `TLICA.PCE`, and `TLICA.ProjectMap` modules are unchanged.

# 4. Rosetta entries added/modified.

- Updated `MAPPING.md` with a new free-will witness section.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with branch profile/content, branch-distinct witness, PCE-differentiated witness, and branch-collapse exclusion entries.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to describe free will as branch-sensitive agency with live alternatives.
- Updated `ROSETTA_BRIDGE_VIEW.md` with bridge rows for free-will witness, PCE-differentiated free will, and branch-collapse exclusion.
- Updated `lean_mapping_round4.md` to point to `TLICA.FreeWill` as the first branch-sensitive witness layer.

# 5. Open mathematical issues requiring user/ChatGPT review.

- Free will is not asserted globally. The layer is a structural witness theory over agency.
- PCE-differentiated free will is stronger than branch-distinct free will and requires projected-PCE value difference.
- The theorem excluding free-will witnesses under branch collapse is conditional on all feasible branch future contents being equal.
- Stochastic projection remains deferred.
- Metaphysical incompatibilism/compatibilism claims are not encoded.
