# Mission Packet — TLICA Profile-Space Helpers

## Mission

Create the next Lean branch:

```text
codex/tlica-profile-space-helpers-v0
```

and add low-risk convenience lemmas for the `ProfileSpace` / pseudo-emetric profile-distance API.

## Current checkpoint

`main` now includes:

- durable TLICA-specific Codex control layer;
- union-domain shell-bound theorem family;
- direct `ProjectMap α Act` / `ProjectedPCE` API migration;
- generated deterministic trajectory helper API;
- machine-verified scalar, shared-domain, and union-domain profile-distance/shell-bound results.

## Strict exclusions

Do not add:

- RCX / religious-experience Lean formalization;
- named affect taxonomy;
- stochastic projection;
- phenomenological duration;
- contestable-boundary Lean theory.

Do not change the underlying definitions of:

- `ScalarProfile`;
- `zeroExtend`;
- `dInfUnion`;
- `dInfShared`;
- `ProfileSpace`;
- the `PseudoEMetricSpace` instance.

This is an API-helper branch, not a foundational refactor.

## Required starting checks

```bash
git fetch --all
git checkout main
git pull origin main
python3 scripts/check_codex_skills.py
bash scripts/bootstrap_codex.sh
lake build
bash scripts/audit_lean.sh
```

If any check fails, repair before creating the work branch.

## Branch creation

```bash
git checkout -b codex/tlica-profile-space-helpers-v0
```

## Primary files

- `TLICA/ProfileComparison/PseudoEMetric.lean`
- `TLICA/ProfileComparison/Pointwise.lean` only if a tiny helper is needed and obviously source-preserving
- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- Rosetta control docs

## Candidate Lean targets

Add only low-risk helper lemmas that make downstream use of `ProfileSpace` cleaner.

Suggested targets in `TLICA/ProfileComparison/PseudoEMetric.lean`:

1. Wrapper identity/coercion helpers, if useful:

```lean
theorem ProfileSpace.ext_zeroExtend ...
```

Only add if a clean statement exists.

2. Direct `edist` bridge lemmas:

```lean
theorem edist_eq_dInfUnion (f g : ProfileSpace α) :
  edist f g = dInfUnion f g
```

If `edist_def` already covers this, do not duplicate unless the new name improves API clarity.

3. Basic pseudo-emetric consequences specialized to profile space:

```lean
theorem edist_self_profile (f : ProfileSpace α) : edist f f = 0

theorem edist_symm_profile (f g : ProfileSpace α) :
  edist f g = edist g f

theorem edist_triangle_profile (f g h : ProfileSpace α) :
  edist f h ≤ edist f g + edist g h
```

Prefer using existing `PseudoEMetricSpace` / `dInfUnion_*` results. Keep statements simple.

4. Bound helper:

```lean
theorem edist_le_one_profile (f g : ProfileSpace α) :
  edist f g ≤ 1
```

This should follow from `dInfUnion_le_one` through `edist_def`.

5. Ball/unfold helper, only if easy:

```lean
theorem mem_emetric_ball_iff_dInfUnion_lt ...
```

Do not fight topology API if this becomes brittle.

6. Cauchy/complete/topology lemmas are out of scope unless immediate from existing API.

## Documentation requirements

If Lean declarations are added, update:

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`
- `docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md`

Required status language:

- `ProfileSpace` is the pseudo-emetric wrapper over `ScalarProfile`.
- `edist` on `ProfileSpace` is definitionally `dInfUnion`.
- Added lemmas are API/convenience theorems, not new foundational distance definitions.
- No changes were made to the underlying profile-distance definitions.

## Required validation

Run:

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

## Required final report

Record:

- theorem/declaration names added;
- whether build/audit passed;
- whether any topology/ball helper was skipped and why;
- no underlying distance definitions changed;
- no prohibited application layers added;
- next recommended branch.

## Commit/push

```bash
git add .
git commit -m "Add profile-space pseudo-emetric helper API"
git push -u origin codex/tlica-profile-space-helpers-v0
```
