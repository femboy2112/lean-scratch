# ORCHESTRATION GO — TLICA Claude Union-Shell Sync

## Invocation

When the user calls the orchestration agent with:

```text
go
```

treat this file as the active instruction packet. Do not ask for confirmation unless a required branch is missing or a destructive conflict cannot be resolved safely.

## Current Situation

Repository:

```text
femboy2112/lean-scratch
```

Last updated Codex branch:

```text
codex/tlica-profile-shell-bound-corollary-v0
```

Claude parallel branch with new Lean work:

```text
claude/test-lean-build-5zO1q
```

Target branch to create/push:

```text
codex/tlica-claude-union-shell-sync-v0
```

## Goal

Synchronize Claude's union-domain shell-bound theorem work into the normalized Codex/Rosetta control layer.

Claude's branch is based on `codex/tlica-profile-shell-bound-corollary-v0` and adds union-domain `dInfUnion` shell-bound theorems in:

```text
TLICA/ProfileComparison/ShellRefinement.lean
```

The branch also includes Lean build result logs under `tlica-results-*` and minor updates to `MAPPING.md`, `NEXT_LEAN_FRONTIER.md`, and `run.sh`.

## Required Discipline

Maintain strict proof discipline:

```text
lake build must pass
bash scripts/audit_lean.sh must pass
no sorry
no admit
no global axiom
```

Do **not** add:

```text
ReligiousExperience.lean
RCX Lean declarations
named affect taxonomy
stochastic projection
phenomenological duration
contestable-boundary Lean theory
```

`RCX-DEFERRED` must remain prose-only and not Lean-ready.

## Phase 1 — Fetch and Create Sync Branch

Run:

```bash
git fetch --all
git checkout codex/tlica-profile-shell-bound-corollary-v0
git pull
git checkout -b codex/tlica-claude-union-shell-sync-v0
```

Then merge or cherry-pick Claude's work from:

```text
claude/test-lean-build-5zO1q
```

Preferred approach:

```bash
git merge --no-ff claude/test-lean-build-5zO1q
```

If the merge creates nontrivial conflicts, resolve conservatively. Preserve the new Lean theorem work. Do not overwrite normalized Rosetta docs with stale versions; when in doubt, keep the more recent normalized Codex wording and then manually add the new union-shell theorem entries.

## Phase 2 — Verify Claude's Added Theorems

Confirm these declarations exist in `TLICA/ProfileComparison/ShellRefinement.lean`:

```text
dInfUnion_le_of_pointwise
dInfUnion_le_of_pointwise_union
dInfUnion_le_shellEndpointBound_zeroExtend
dInfUnion_le_threeWayMax_shellEndpointBound
dInfUnion_le_of_pointwise_shellEndpointBound
```

Mathematical interpretation:

1. `dInfUnion_le_of_pointwise`
   - Foundation supremum lemma for `dInfUnion`.
   - If every zero-extended pointwise difference is bounded by `B`, then `dInfUnion f g ≤ ENNReal.ofReal B`.

2. `dInfUnion_le_of_pointwise_union`
   - Variant requiring pointwise bound only on `f.domain ∪ g.domain`.
   - Outside both domains, both zero-extensions are `0`.

3. `dInfUnion_le_shellEndpointBound_zeroExtend`
   - Uniform all-ambient zero-extension shell theorem.
   - Clean but restrictive sufficient condition.

4. `dInfUnion_le_threeWayMax_shellEndpointBound`
   - Preferred source-shape theorem.
   - If each profile's own-domain values lie in shells `i` and `j`, then `dInfUnion` is bounded by the max of:
     - `i` vs `j` for shared-domain points,
     - `i` vs `outer` for `f`-only points,
     - `outer` vs `j` for `g`-only points.

5. `dInfUnion_le_of_pointwise_shellEndpointBound`
   - Most general variable-shell union theorem.
   - Allows shell indices to vary by point, with a uniform endpoint bound `B`.

## Phase 3 — Build and Audit

Run:

```bash
lake build
bash scripts/audit_lean.sh
```

Then run:

```bash
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
```

If `lake build` fails, repair the Lean before touching documentation. Do not use `sorry`, `admit`, or `axiom`.

If `audit_lean.sh` fails, repair before proceeding.

## Phase 4 — Update Verification Report

Update:

```text
docs/tlica_codex/LEAN_VERIFICATION_REPORT.md
```

It must state:

- Base branch: `codex/tlica-profile-shell-bound-corollary-v0`
- Source Claude branch: `claude/test-lean-build-5zO1q`
- Current branch: `codex/tlica-claude-union-shell-sync-v0`
- Whether Claude's branch was merged or cherry-picked.
- `lake build` status.
- `bash scripts/audit_lean.sh` status.
- zero `sorry`, zero `admit`, zero global `axiom`.
- Exact theorem names added.
- Whether any intermediate build failure occurred and how it was fixed.
- Whether the new theorem family closes the union-domain shell-bound target.
- Remaining exclusions: no RCX, no named affect taxonomy, no stochastic projection, no phenomenological duration.

## Phase 5 — Update Rosetta and Control Docs

Update all relevant docs so the new union-shell work is not merely present in Lean but integrated into the Rosetta control layer.

Required files:

```text
MAPPING.md
docs/tlica_codex/lean_declaration_inventory.md
docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md
docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md
docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md
docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md
docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md
docs/tlica_rosetta/SHELL_BOUNDARY_CONVENTION_AUDIT.md
docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md
```

Required status language:

```text
scalar seven-shell theorem: machine verified
shared-domain dInfShared shell bounds: machine verified
union-domain dInfUnion shell bounds: machine verified
three-way max shell theorem: machine verified; preferred source-shape theorem for own-domain shell assignments
zero-extension shell theorem: machine verified; preferred direct union API
```

Also state:

```text
No RCX formalization.
No named affect taxonomy.
No stochastic projection.
No phenomenological duration.
Contestable boundary remains source-ambiguous and not Lean-ready.
```

## Phase 6 — Handle `interiorShellIndexDistance`

Claude previously flagged `interiorShellIndexDistance` as orphaned.

Either:

### Option A — Add low-risk theorem usage

Add simple theorems in `TLICA/ProfileComparison/ShellRefinement.lean`, for example:

```lean
theorem interiorShellIndexDistance_self (i : Fin 5) :
    interiorShellIndexDistance i i = 0 := by
  ...
```

If clean, also add:

```lean
theorem interiorShellIndexDistance_symm (i j : Fin 5) :
    interiorShellIndexDistance i j = interiorShellIndexDistance j i := by
  ...
```

Only add if they compile quickly.

### Option B — Document as currently internal/unused

If proofs create friction, do not fight Lean. Mark it in documentation as an internal helper currently not used in exported theorem statements.

## Phase 7 — Preserve Source-Version Note

Ensure `docs/tlica_rosetta/SHELL_BOUNDARY_CONVENTION_AUDIT.md` includes a section like:

```text
Source-version note:
The encoded seven-shell convention is taken from the working-paper / formal-apparatus sources cited in this audit, especially `04_profiles.md` and `profile_comparison_v0_2.md`. If a later source edition changes shell numbering, endpoint inclusivity, or strict-not-I treatment, `ShellIndex7`, `shellOf7`, and the shell-bound theorem family must be re-audited. The current Lean theorem family is valid for the encoded convention regardless of later prose changes.
```

## Phase 8 — Decide Whether to Keep Build Logs

Claude's branch contains result folders such as:

```text
tlica-results-20260513-1654/
tlica-results-20260513-1734/
```

Either keep them as useful provenance or move/summarize them under a clearer docs path. Do not delete them unless the verification report preserves the essential information.

Preferred: keep them for now, because they record cloud Lean build success.

## Phase 9 — Final Verification

Run again:

```bash
lake build
bash scripts/audit_lean.sh
git status
git diff --stat
```

The final report must be green before commit.

## Phase 10 — Commit and Push

Commit message suggestion:

```text
Sync Claude union-domain shell bounds into Rosetta control layer
```

Push:

```bash
git push -u origin codex/tlica-claude-union-shell-sync-v0
```

## Expected End State

The branch should contain:

- Claude's five `dInfUnion` shell-bound theorems.
- Green `lake build`.
- Green `audit_lean.sh`.
- Updated declaration inventory.
- Updated Rosetta ledger / coverage / matrix / backlog.
- Updated shell boundary audit documenting union-domain theorem status.
- Updated `NEXT_LEAN_FRONTIER.md` marking union shell bound complete.
- No religious-experience Lean module.
- No named affect taxonomy.
- No stochastic projection.
- No phenomenological duration.

After this branch, the likely next branch is:

```text
codex/tlica-direct-projected-pce-api-v0
```

whose purpose is to migrate newer modules away from compatibility names toward the primary `ProjectMap α Act` / `ProjectedPCE` API.
