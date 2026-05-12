# 1. Build status.

Baseline `lake build` on branch `codex/tlica-agency-v0` succeeded before edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After adding the agency layer, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA.lean`
- `TLICA/Agency.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
- `docs/tlica_rosetta/lean_mapping_round4.md`

# 3. Lean declarations added/modified.

Added and machine-verified:

- `TLICA.Agency.AgencyContext`
- `TLICA.Agency.AgencyContext.fam`
- `TLICA.Agency.AgencyContext.globalRank`
- `TLICA.Agency.AgencyContext.proj`
- `TLICA.Agency.AgencyContext.feasible`
- `TLICA.Agency.AgencyContext.noAction_feasible`
- `TLICA.Agency.feasibleProjectedPCE`
- `TLICA.Agency.selectsFeasibleAction`
- `TLICA.Agency.liveAlternative`
- `TLICA.Agency.hasLiveAlternatives`
- `TLICA.Agency.pceDifferentiatedAlternative`
- `TLICA.Agency.AgencyWitness`
- `TLICA.Agency.AgencyWitness.selected`
- `TLICA.Agency.AgencyWitness.selected_feasible`
- `TLICA.Agency.AgencyWitness.selected_max`
- `TLICA.Agency.AgencyWitness.selected_is_feasible`
- `TLICA.Agency.AgencyWitness.selected_maximizes`
- `TLICA.Agency.AgencyWitness.selects_selected`
- `TLICA.Agency.witness_of_selectsFeasibleAction`
- `TLICA.Agency.selectsFeasibleAction_of_witness`
- `TLICA.Agency.not_exists_feasible_strictly_higher_of_selects`
- `TLICA.Agency.exists_distinct_feasible_of_hasLiveAlternatives`
- `TLICA.Agency.pceDifferentiatedAlternative_of_selected_strictly_beats`
- `TLICA.Agency.finiteFeasibleSelection_deferred`

Modified:

- `TLICA.lean` now imports `TLICA.Agency`.

Preserved:

- Existing `TLICA.PCE.PCE` is unchanged.
- Existing `TLICA.ActionProjection.ProjectedPCE` is unchanged.
- Existing `TLICA.GeneralActionProjection.GeneralProjectedPCE` is unchanged.
- Existing `TLICA.ProjectMap.ProjectMap` and `TLICA.GeneralActionProjection.GeneralProjectMap` are unchanged.

# 4. Rosetta entries added/modified.

- Updated `MAPPING.md` with a new agency-layer section.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with agency context, feasible selection, live alternatives, PCE-differentiated alternatives, and finite-selection deferred marker entries.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to describe agency as feasible projected-PCE selection.
- Updated `ROSETTA_BRIDGE_VIEW.md` with bridge rows for agency context, feasible selection, nontrivial agency, and PCE-differentiated agency.
- Updated `lean_mapping_round4.md` to point to `TLICA.Agency` as the first agency layer while leaving free will deferred.

# 5. Open mathematical issues requiring user/ChatGPT review.

- Existence of feasible selected actions is not asserted globally. It requires an explicit `selectsFeasibleAction` hypothesis, an `AgencyWitness`, or future finite/compact feasible-set assumptions.
- Nontrivial agency requires `hasLiveAlternatives`; no profile is assumed to have live alternatives by default.
- PCE-differentiated agency requires feasible alternatives with different projected-PCE values; this branch only proves conditional consequences.
- `finiteFeasibleSelection_deferred` is a non-substantive marker for a future finite feasible-action maximizer theorem.
- Free will remains deferred; this branch formalizes agency selection only.
