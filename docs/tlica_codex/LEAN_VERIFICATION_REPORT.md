# Lean Verification Report

## 1. Branch scope

- Base branch: `codex/tlica-foundation-refinement-v0_4_1`
- Inherited normalization branch: `codex/tlica-rosetta-normalization-v0`
- Current cleanup branch: `codex/tlica-rosetta-normalization-v1`

This normalization line is documentation/audit-only. It records normalized Rosetta IDs, coverage audits, source-alignment classifications, and deferral boundaries. It does not add Lean theory, religious-experience formalization, or theorem-content changes.

No Lean source files changed in normalization v0/v1. If a later cleanup changes a documentation generator or audit script, that should be listed separately; this cleanup does not.

## 2. Verification status

Baseline verification on inherited branch `codex/tlica-rosetta-normalization-v0`:

- `lake build` succeeds.
- `bash scripts/audit_lean.sh` succeeds.
- Audit result: zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

Final verification on current branch `codex/tlica-rosetta-normalization-v1`:

- `lake build` succeeds.
- `bash scripts/audit_lean.sh` succeeds.
- Audit result: zero `sorry`, zero `admit`, and zero global `axiom` declarations in imported Lean files.

Remaining `lake build` output is warning-only and comes from existing duplicate-namespace lints plus existing unused-variable warnings.

## 3. New/updated docs

- `MAPPING.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_PURE_MATH_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_BRIDGE_VIEW.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/SOURCE_ALIGNMENT_AUDIT.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`

## 4. Normalization summary

- Active Rosetta rows use normalized IDs only: `FND-###`, `PRF-###`, `ORP-###`, `ACT-###`, `AGY-###`, `FWL-###`, `TMP-###`, `AFF-###`, and `RCX-DEFERRED`.
- Historical application IDs are retained only through the historical crosswalk or compatibility notes.
- `ORP-001` to `ORP-007` remain the active foundation orphan-cluster rows.
- `ORP-008` to `ORP-015` are superseded by `ACT-001` to `ACT-009`.
- Older application-row numbering for agency, free will, temporal trajectory, and affect is superseded by the normalized `AGY`, `FWL`, `TMP`, and `AFF` rows.
- `RCX-DEFERRED` remains prose-only/application-deferred. No `TLICA/ReligiousExperience.lean` module or RCX Lean declarations are added.

## 5. Deferred boundaries

- Full shell-stratified bound remains a deferred marker only.
- Stochastic projection and phenomenological duration remain deferred.
- Named affect taxonomy and substrate/source-opacity pathways remain deferred markers only.
- Religiously charged experience remains deferred pending prose/math refinement.
