# CODEX GO NEXT

Use this file when the user says `go`.

## Starting branch

`codex/tlica-claude-union-shell-sync-v0`

This is the latest verified sync branch. It includes Claude's union-domain shell-bound theorem family and updated Rosetta/control docs.

## Target canonical branch

`main`

The repo may not have `main` yet. The current default branch may still be `claude/tlica-lean-compilation-WWXY9`. Check first.

## Next work branch

`codex/tlica-direct-projected-pce-api-v0`

## Non-negotiable checks

Run and keep green:

```bash
lake build
bash scripts/audit_lean.sh
```

Maintain:

- no `sorry`
- no `admit`
- no global `axiom`
- no religious-experience Lean module
- no named affect taxonomy
- no stochastic projection
- no phenomenological duration
- no contestable-boundary Lean theory

## Phase 1 — Verify latest sync branch

```bash
git fetch --all
git checkout codex/tlica-claude-union-shell-sync-v0
git pull
lake build
bash scripts/audit_lean.sh
```

If build or audit fails, repair before touching `main`.

## Phase 2 — Create or update `main`

Check whether `main` exists:

```bash
git ls-remote --heads origin main
```

If `main` does not exist:

```bash
git checkout -b main codex/tlica-claude-union-shell-sync-v0
```

If `main` exists:

```bash
git checkout main
git pull origin main
git merge --no-ff codex/tlica-claude-union-shell-sync-v0
```

Preserve latest Lean theorem work, Rosetta docs, declaration inventory, and Claude result logs.

## Phase 3 — Clear obsolete prompt/orchestration files on `main`

Remove stale one-shot orchestration prompt files, including this file if it is present on `main` after the merge:

```text
ORCHESTRATION_GO.md
CODEX_GO_NEXT.md
```

Search:

```bash
find . -maxdepth 3 \( -iname '*prompt*' -o -iname '*handoff*' -o -iname '*orchestration*' -o -iname '*go*' \) -print
```

Do not remove source papers, Rosetta docs, verification reports, build logs, result logs, declaration inventory, or durable project documentation. If unsure, keep the file and note it in the verification report.

## Phase 4 — Verify and push `main`

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

Update `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md` to record:

- whether `main` existed before this task
- whether `main` was created or updated
- prompt/orchestration files removed
- build status
- audit status
- declaration inventory status
- zero `sorry` / `admit` / global `axiom`

Commit and push:

```bash
git add .
git commit -m "Establish main at verified TLICA union-shell checkpoint"
git push -u origin main
```

If there is nothing to commit, still record the verification result.

## Phase 5 — Create direct API work branch

```bash
git checkout main
git pull origin main
git checkout -b codex/tlica-direct-projected-pce-api-v0
```

## Phase 6 — Direct API migration

Goal: migrate active modules away from compatibility names where proof-stable.

Primary API:

- `ProjectMap α Act`
- `ProjectedPCE`
- `projectedProfile`
- `futureMSI`
- `futureMSIContents`

Compatibility-only names:

- `GeneralProjectMap`
- `GeneralProjectedPCE`
- `generalProjectedProfile`
- `generalFutureMSI`
- `generalFutureMSIContents`

Inspect usage:

```bash
grep -R "GeneralProjectMap\|GeneralProjectedPCE\|generalProjectedProfile\|generalFutureMSI\|generalFutureMSIContents" TLICA docs MAPPING.md || true
```

Likely files:

- `TLICA/Agency.lean`
- `TLICA/FreeWill.lean`
- `TLICA/TemporalTrajectory.lean`
- `TLICA/DifferentiatedAffect.lean`
- `TLICA/GeneralActionProjection.lean`

Rules:

- Do not delete `TLICA/GeneralActionProjection.lean`.
- Keep compatibility aliases/theorems for older branch continuity.
- Prefer direct definitions only where build remains stable.
- Do not add new theory; this is API hygiene.

Examples to consider:

- Change `proj : GeneralProjectMap α Act` to `proj : ProjectMap α Act` if clean.
- Change `feasibleProjectedPCE := GeneralProjectedPCE ...` to `ProjectedPCE ...` if clean.
- Preserve or update bridge theorem `feasibleProjectedPCE_eq_projectedPCE`.

## Phase 7 — Verify direct API branch

Run:

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

Update docs:

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`
- `docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md`

Required language:

- `ProjectMap α Act` is primary.
- `ProjectedPCE` is primary.
- `GeneralProjectMap` / `GeneralProjectedPCE` are compatibility-only.
- active modules use direct API wherever proof-stable.
- remaining compatibility use is intentional and documented.
- union-domain shell theorem family is machine verified.

## Phase 8 — Commit and push direct API branch

```bash
git add .
git commit -m "Migrate active modules toward direct ProjectedPCE API"
git push -u origin codex/tlica-direct-projected-pce-api-v0
```

Final response should report:

- whether `main` was created or updated
- commit hash pushed to `main`
- obsolete prompts removed
- API migrations completed
- compatibility uses remaining and why
- build/audit result
- next recommended branch
