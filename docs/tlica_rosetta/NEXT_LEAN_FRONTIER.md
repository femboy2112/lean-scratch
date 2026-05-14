# Next Lean Frontier

Scope: recommended Lean-ready or prose-first branches after
`codex/tlica-profile-shell-bound-corollary-v0`.

## Recommended Branches

1. ~~`codex/tlica-union-shell-bound-v0`~~ — **done** (landed on
   `claude/test-lean-build-5zO1q` rather than a codex branch): five
   `dInfUnion` shell-bound theorems in
   `TLICA/ProfileComparison/ShellRefinement.lean`, parallel to the
   `dInfShared_le_*` family, absorbing absent values into the `outer`
   shell.

2. `codex/tlica-direct-projected-pce-api-v0`
   - Migrate new modules from compatibility names to primary
     `ProjectMap`/`ProjectedPCE` names where this is proof-stable.
   - Use the existing direct bridge lemmas before refactoring definitions.

3. `codex/tlica-generated-trajectory-api-v0`
   - Expand deterministic trajectory helper API around `generatedBy`,
     one-step branches, and adjacent profile distances.
   - Keep the layer deterministic.

4. `codex/tlica-profile-space-helpers-v0`
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
