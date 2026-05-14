# Next Lean Frontier

Scope: recommended Lean-ready or prose-first branches after
`codex/tlica-direct-projected-pce-api-v0`.

## Recommended Branches

1. ~~`codex/tlica-union-shell-bound-v0`~~ — **done** (landed on
   `claude/test-lean-build-5zO1q` and synced into
   `codex/tlica-claude-union-shell-sync-v0`): five
   `dInfUnion` shell-bound theorems in
   `TLICA/ProfileComparison/ShellRefinement.lean`, parallel to the
   `dInfShared_le_*` family, absorbing absent values into the `outer`
   shell.

2. ~~`codex/tlica-direct-projected-pce-api-v0`~~ — **done**:
   active agency, free-will, temporal, and affect modules now use primary
   `ProjectMap`/`ProjectedPCE`, `projectedProfile`, and
   `futureMSIContents` names where proof-stable. Compatibility names remain
   only in `TLICA.GeneralActionProjection` for older branch continuity.

3. `codex/tlica-profile-space-helpers-v0`
   - Add convenience lemmas for `ProfileSpace`, `edist_def`, and the
     pseudometric/profile-distance API.
   - Avoid changing the underlying distance definitions.

5. `codex/tlica-contestable-boundary-source-refinement-v0`
   - Prose/math refinement only until the source chooses the meaning of
     contestability.
   - Do not add new Lean theory for contestable boundaries before that choice.

## Explicit Exclusions

- No RCX Lean formalization.
- No named affect taxonomy.
- No stochastic projection.
- No phenomenological duration.
- No contestable-boundary Lean theory until source ambiguity is resolved.
