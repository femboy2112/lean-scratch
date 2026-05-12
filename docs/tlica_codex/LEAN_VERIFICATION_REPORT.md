# Lean Verification Report

## 1. Branch scope

- Base branch: `codex/tlica-source-alignment-v0_4`
- Current branch: `codex/tlica-v0_4-completeness-and-release-audit`

This branch is a large-session completeness/release audit for the v0.4
mathematical checkpoint. It does not add Lean theory, does not add a major
application module, and does not add religious-experience formalization.

No Lean source files changed in this branch. The work is documentation,
release-readiness, backlog, and overclaim-audit cleanup.

## 2. Verification status

Inherited branch verification on `codex/tlica-source-alignment-v0_4`:

- `git fetch --all`: succeeded.
- `git checkout codex/tlica-source-alignment-v0_4`: already on/up to date.
- `git pull`: already up to date.
- `lake build`: succeeded, with existing warning-only duplicate-namespace and unused-variable lints.
- `bash scripts/audit_lean.sh`: succeeded.

Current branch verification on `codex/tlica-v0_4-completeness-and-release-audit`:

- `lake exe cache get`: succeeded; no files to download.
- `lake build`: succeeded, with the same existing warning-only lints.
- `bash scripts/audit_lean.sh`: succeeded.
- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`: succeeded.

Audit result:

- Zero `sorry` in imported Lean files.
- Zero `admit` in imported Lean files.
- Zero global `axiom` declarations in imported Lean files.

## 3. Files added or changed

Added:

- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`
- `docs/tlica_codex/MERGE_READINESS_v0_4.md`
- `docs/tlica_codex/RELEASE_SUMMARY_v0_4.md`

Changed:

- `docs/tlica_rosetta/rosetta_stone_v0_2.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`

Regenerated with no content diff:

- `docs/tlica_codex/lean_declaration_inventory.md`

## 4. Completeness finding

Have all TLICA features been mathematically explained?

No. The project has a verified foundation spine and first structural kernels for
agency, free will, deterministic temporal trajectory, and differentiated affect.
Several features remain partial, deferred, or prose-only.

## 5. Top P0/P1/P2 findings

P0:

- No imported Lean theorem overclaim was found.
- Documentation must continue to avoid wording that treats `GeneralProjectMap`
  as primitive, treats foundation-default `PCE` as action-differentiating, or
  describes agency/free will/affect/RCX as fully formalized.

P1:

- Replace `finiteFeasibleSelection_deferred` with a finite nonempty feasible-set
  maximizer theorem.
- Replace `shellStratifiedBound_deferred` once shell boundary conventions are
  explicit.
- Add low-risk temporal stability lemmas from existing `dInfUnion` facts.
- Add affect-kernel implication refinements without introducing named affect taxonomy.
- Add optional `ProfileIso` / `CoherentFutureMSIModel` coherence lemmas.

P2:

- Prefer direct `ProjectedPCE` names in future code and docs; keep
  `GeneralProjectedPCE` compatibility-only.
- Add generated-trajectory helper APIs if downstream temporal proofs need them.
- Add branch-distance helper lemmas for affect/temporal reuse.
- Clarify whether `contestableBoundary` should remain a named set or become a
  fuller structure/theorem target.

## 6. Deferred boundaries

- No religious-experience Lean module exists or was added.
- `RCX-DEFERRED` remains prose-only and needs source refinement before Lean.
- Stochastic projection, phenomenological duration, richer temporal-continuity
  metrics, named affect taxonomy, love as constitutive extension, substrate
  affect pathways, and source-opacity affect remain deferred.

## 7. Next recommended branch

Recommended next branch:

`codex/tlica-finite-agency-selection`

Rationale: finite feasible-action maximizer existence is a high-value P1 target,
is local to the agency layer, and would turn an explicit deferred marker into a
machine-verified theorem under clear finite/nonempty hypotheses.
