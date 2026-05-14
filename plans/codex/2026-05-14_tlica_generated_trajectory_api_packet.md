# Mission Packet — TLICA Generated Trajectory API

## Mission

Create the next Lean branch:

```text
codex/tlica-generated-trajectory-api-v0
```

and expand deterministic trajectory helper APIs around `generatedBy`, one-step branches, and adjacent profile distances.

## Current checkpoint

`main` now includes:

- Codex control layer scaffold.
- Claude union-domain shell-bound sync.
- Direct `ProjectMap α Act` / `ProjectedPCE` API migration.
- Machine-verified scalar, shared-domain, and union-domain shell-bound theorem families.

## Strict exclusions

Do not add:

- RCX / religious-experience Lean formalization;
- named affect taxonomy;
- stochastic projection;
- phenomenological duration;
- contestable-boundary Lean theory.

Keep the trajectory layer deterministic.

## Required starting checks

```bash
git fetch --all
git checkout main
git pull origin main
lake build
bash scripts/audit_lean.sh
python3 scripts/check_codex_skills.py
```

If any check fails, repair before creating the work branch.

## Branch creation

```bash
git checkout -b codex/tlica-generated-trajectory-api-v0
```

## Primary files

- `TLICA/TemporalTrajectory.lean`
- `TLICA/FreeWill.lean` only if needed for branch-content bridges
- `TLICA/DifferentiatedAffect.lean` only if needed for non-circular aliases
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- Rosetta control docs

## Candidate theorem/API targets

Add only low-risk deterministic helper lemmas. Suggested targets:

1. More generated trajectory unfold lemmas around `generatedBy`.
2. One-step branch profile/future-content aliases using the primary direct API.
3. Adjacent `stepUnionDistance` and `stepSharedDistance` convenience lemmas.
4. Bridges from existing free-will witnesses to deterministic one-step trajectory facts.
5. Naming helpers that reduce downstream dependence on compatibility names.

Do not force theorem statements if the source or dependencies are unclear.

## Required validation

Run:

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

## Required documentation updates

Update, if Lean/status changed:

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`
- `docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md`

## Required final report

Record:

- theorem/declaration names added;
- whether build/audit passed;
- any compatibility-name use that remains;
- no prohibited application layers added;
- next recommended branch.

## Commit/push

```bash
git add .
git commit -m "Expand deterministic generated trajectory API"
git push -u origin codex/tlica-generated-trajectory-api-v0
```
