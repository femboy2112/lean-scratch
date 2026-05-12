# 1. Build status.

Baseline `lake build` on branch `codex/tlica-temporal-trajectory-v0` succeeded before differentiated-affect edits.

Baseline `bash scripts/audit_lean.sh` succeeded with zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

After adding the differentiated-affect layer, `lake build` succeeds. Remaining output is warning-only and comes from existing duplicate-namespace lints plus deterministic-default unused-variable warnings.

Final audit status: `bash scripts/audit_lean.sh` succeeds with zero `sorry`/`admit`/global-axiom findings.

# 2. Files changed.

- `TLICA/DifferentiatedAffect.lean`
- `TLICA.lean`
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`

# 3. Inherited declarations confirmed before editing.

Free-will/agency ladder:

- `TLICA.FreeWill.PCEFreeWillWitness`
- `TLICA.FreeWill.PCEFreeWillWitness.toFreeWillWitness`
- `TLICA.FreeWill.freeWillWitness_of_pceFreeWillWitness`
- `TLICA.FreeWill.PCEFreeWillWitness.hasLiveAlternatives`
- `TLICA.FreeWill.FreeWillWitness.hasLiveAlternatives`
- `TLICA.Agency.hasLiveAlternatives`
- `TLICA.Agency.selectsFeasibleAction`

Temporal trajectory layer:

- `TLICA.TemporalTrajectory.ProfileTrajectory`
- `TLICA.TemporalTrajectory.ActionSchedule`
- `TLICA.TemporalTrajectory.generatedBy`
- `TLICA.TemporalTrajectory.stepUnionDistance`
- `TLICA.TemporalTrajectory.stepSharedDistance`
- `TLICA.TemporalTrajectory.unionStepStable`
- `TLICA.TemporalTrajectory.eventuallyUnionStepStable`
- `TLICA.TemporalTrajectory.freeWillWitness_oneStep_branch_contents_distinct`
- `TLICA.TemporalTrajectory.pceFreeWillWitness_oneStep_branch_contents_distinct`

# 4. Lean declarations added.

Added and machine-verified:

- `TLICA.DifferentiatedAffect.relativePCEDelta`
- `TLICA.DifferentiatedAffect.pceSupportive`
- `TLICA.DifferentiatedAffect.pceNeutral`
- `TLICA.DifferentiatedAffect.pceDefeating`
- `TLICA.DifferentiatedAffect.pceSupportive_iff`
- `TLICA.DifferentiatedAffect.pceDefeating_iff`
- `TLICA.DifferentiatedAffect.pceNeutral_iff`
- `TLICA.DifferentiatedAffect.pceValence_trichotomy`
- `TLICA.DifferentiatedAffect.pceSupportive_not_neutral`
- `TLICA.DifferentiatedAffect.pceSupportive_not_defeating`
- `TLICA.DifferentiatedAffect.pceDefeating_not_neutral`
- `TLICA.DifferentiatedAffect.branchUnionDistance`
- `TLICA.DifferentiatedAffect.branchSharedDistance`
- `TLICA.DifferentiatedAffect.branchProfileShift`
- `TLICA.DifferentiatedAffect.branchFutureContents_eq_of_branchProfile_eq`
- `TLICA.DifferentiatedAffect.branchProfile_ne_of_branchFutureContents_ne`
- `TLICA.DifferentiatedAffect.PCESupportAffectWitness`
- `TLICA.DifferentiatedAffect.PCEDefeatAffectWitness`
- `TLICA.DifferentiatedAffect.PCENeutralAffectWitness`
- `TLICA.DifferentiatedAffect.ProfileShiftAffectWitness`
- `TLICA.DifferentiatedAffect.AffectKernelWitness`
- `TLICA.DifferentiatedAffect.affectKernel_of_pceSupport`
- `TLICA.DifferentiatedAffect.affectKernel_of_pceDefeat`
- `TLICA.DifferentiatedAffect.affectKernel_of_profileShift`
- `TLICA.DifferentiatedAffect.profileShiftAffectWitness_of_freeWillWitness`
- `TLICA.DifferentiatedAffect.affectKernel_of_freeWillWitness`
- `TLICA.DifferentiatedAffect.affectKernel_of_pceFreeWillWitness`
- `TLICA.DifferentiatedAffect.no_affectKernel_of_branch_and_pce_collapse`
- `TLICA.DifferentiatedAffect.temporalAffectIntensity`
- `TLICA.DifferentiatedAffect.temporalAffectIntensity_nonneg`
- `TLICA.DifferentiatedAffect.temporalAffectIntensity_le_of_unionStepStable`

Added as explicit deferred markers, not theorem claims:

- `TLICA.DifferentiatedAffect.namedAffectTaxonomy_deferred`
- `TLICA.DifferentiatedAffect.loveConstitutiveExtension_deferred`
- `TLICA.DifferentiatedAffect.substrateAffectPathway_deferred`
- `TLICA.DifferentiatedAffect.sourceOpacityAffect_deferred`

Preserved:

- Existing `TLICA.TemporalTrajectory`, `TLICA.FreeWill`, `TLICA.Agency`, `TLICA.GeneralActionProjection`, `TLICA.ActionProjection`, `TLICA.PCE`, and `TLICA.ProjectMap` modules are unchanged.

# 5. Rosetta entries added/modified.

- Updated `MAPPING.md` with the profile/PCE differentiated-affect kernel and deferred markers.
- Updated `ROSETTA_MATH_FIRST_LEDGER.md` with relative PCE valence, branch-profile shift, affect witnesses, witness bridges, collapse exclusion, and temporal intensity entries.
- Updated `ROSETTA_PURE_MATH_VIEW.md` to state that PCE-support, defeat, and neutrality are baseline-relative.
- Updated `ROSETTA_BRIDGE_VIEW.md` with free-will/PCE-free-will bridges into affect-kernel witnesses.
- Regenerated `lean_declaration_inventory.md`.

# 6. Open mathematical issues requiring user/ChatGPT review.

- `TLICA.DifferentiatedAffect` depends on `TemporalTrajectory`, `FreeWill`, `Agency`, `GeneralActionProjection`, and the existing profile-comparison distance layer.
- This branch formalizes only the first profile/PCE affect kernel.
- Free-will witnesses yield profile-shift affect kernels.
- PCE-free-will witnesses yield PCE-differentiated affect kernels.
- Named affect taxonomy remains deferred.
- Substrate and source-opacity affect pathways remain deferred.
