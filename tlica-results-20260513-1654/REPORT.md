# TLICA Lean Build Verification — 2026-05-13

## Source

- Branch tested: `codex/tlica-profile-shell-bound-corollary-v0`
- Commit: `411c5ba49733206c4178a03275382a3e09eb71d4`
  ("Add profile shell endpoint corollaries", 2026-05-12)
- Toolchain: `leanprover/lean4:v4.11.0`
- mathlib: pinned at `v4.11.0`

## Result

**GREEN** — `lake build` exit code 0 (1297/1297 targets built).
Priority-theorem type-check exit code 0 (all 9 signatures resolved).

## Logs

| File | Step | Notes |
|---|---|---|
| `01-lake-update.log` | `lake update` | Cloned mathlib + 6 deps; post-update hook auto-fetched 5011 .olean cache files. |
| `03-lake-build.log`  | `lake build`  | Green; only 6 `unused variable` linter warnings in `ShellRefinement.lean`. |
| `04-type-check.log`  | `lean` check  | All 9 priority signatures (rounds 1+2+3) resolved. |

No `lake exe cache get` step was needed: the mathlib post-update hook
fetched the prebuilt oleans automatically during `lake update`.

## Environment notes (this sandbox)

- elan was installed directly via the upstream installer (`install.sh`
  uses `sudo apt-get` which is unavailable here, but the apt packages it
  would install were already present).
- The mathlib clone + cache fetch was the only slow phase (~5 min).
  Subsequent `lake build` was fast (cache hit).
