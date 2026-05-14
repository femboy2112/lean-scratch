# AGENTS.md — TLICA Lean / Rosetta Instructions

You are working in the TLICA formalization repository. Your task is mathematical formalization and Rosetta synchronization.

## Immediate instruction

If the user says only:

```text
go
```

or asks you to continue the next TLICA task, immediately read and execute:

```text
CODEX_GO_NEXT.md
```

Do not ask the user to paste the prompt. The prompt is already in the repository.

## Current priority

The active next task is:

1. Establish or update `main` from `codex/tlica-claude-union-shell-sync-v0`.
2. Remove stale one-shot prompt/orchestration files from `main`.
3. Create `codex/tlica-direct-projected-pce-api-v0` from `main`.
4. Migrate active modules toward the primary `ProjectMap α Act` / `ProjectedPCE` API where proof-stable.

Detailed phase instructions are in `CODEX_GO_NEXT.md`.

## Hard rules

1. Imported Lean modules must compile with `lake build`.
2. Run `bash scripts/audit_lean.sh` before committing.
3. Do not use `sorry`, `admit`, or global `axiom` declarations.
4. If a claim is primitive in the theory, encode it as a named structure field, typeclass field, or documented axiom schema. Do not present it as proved.
5. If a proof depends on an assumption, name that assumption and map it to its source reference.
6. Do not alter files in `docs/tlica_source_corpus/` except by explicit user request.
7. Every new Lean declaration must be reflected in `MAPPING.md`, `docs/tlica_codex/lean_declaration_inventory.md`, and the relevant Rosetta control docs.
8. Preserve the distinction between:
   - machine-verified theorem,
   - definition/signature,
   - primitive axiom/field,
   - compatibility alias/theorem,
   - deferred marker not theorem,
   - prose-only unformalized target.

## Explicit exclusions

Do not add:

- `TLICA/ReligiousExperience.lean`
- RCX Lean declarations
- named affect taxonomy
- stochastic projection
- phenomenological duration
- contestable-boundary Lean theory

`RCX-DEFERRED` remains prose-only and not Lean-ready.

## Build/audit commands

Run these before committing:

```bash
lake exe cache get
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

## Main local documents

- `CODEX_GO_NEXT.md` — current execution prompt.
- `MAPPING.md` — Lean declaration map.
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md` — current verification report.
- `docs/tlica_codex/lean_declaration_inventory.md` — extracted declaration inventory.
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md` — normalized Rosetta ledger.
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md` — declaration-to-Rosetta coverage.
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md` — Rosetta-to-Lean coverage audit.
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md` — formalization completeness matrix.
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md` — prioritized Lean backlog.
- `docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md` — next branch sequence.

## Commit discipline

Commit after a coherent verified step. Use precise commit messages and push the branch requested in `CODEX_GO_NEXT.md`.
