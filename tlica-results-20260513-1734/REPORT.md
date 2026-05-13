# TLICA Lean Build Verification — 2026-05-13 (union-shell-bound)

## Source

- Branch: `claude/test-lean-build-5zO1q` (merged from
  `codex/tlica-profile-shell-bound-corollary-v0` @ `411c5ba` plus new
  `dInfUnion` shell-bound work).
- Toolchain: `leanprover/lean4:v4.11.0`.
- mathlib: pinned at `v4.11.0`.

## Result

**GREEN** — `lake build` exit 0, 1313/1313 targets.
Priority-theorem `#check` exit 0; all five new declarations resolved.

## What was added

Five theorems appended to `TLICA/ProfileComparison/ShellRefinement.lean`,
parallel to the existing `dInfShared_le_*` family but for the union form
`dInfUnion`:

| Theorem | Role |
|---|---|
| `dInfUnion_le_of_pointwise`                 | Foundation lemma — `iSup_le` step over `α`. |
| `dInfUnion_le_of_pointwise_union`           | Variant with hypothesis restricted to `f.domain ∪ g.domain`. |
| `dInfUnion_le_shellEndpointBound_zeroExtend` | Direct zero-extension shell bound. |
| `dInfUnion_le_threeWayMax_shellEndpointBound` | Source-paper hypothesis shape: each profile's shell stated on its own subtype domain; outer-shell absorbs absent values, paid for by a three-way max. |
| `dInfUnion_le_of_pointwise_shellEndpointBound` | Pointwise-varying shell indices. |

Also: legacy `shellStratifiedBound_deferred` docstring updated to point at
the new theorems; `MAPPING.md` extended with two row additions;
`run.sh` priority-check block extended with five `#check` lines;
`NEXT_LEAN_FRONTIER.md` target #1 marked done.

## Build target count

| Before | After | Δ |
|---|---|---|
| 1305 (codex baseline) | 1313 | +8 |

The +8 covers the five theorems' `.olean` / `.c` / `.o` artefacts and the
two corollary type-class targets the existing siblings each produced.
No previously-green target turned red.

## Logs

| File | Step |
|---|---|
| `01-lake-update.log` | `lake update` |
| `03-lake-build.log`  | `lake build` (exit 0) |
| `04-type-check.log`  | five `#check`s against the new theorems (exit 0) |
