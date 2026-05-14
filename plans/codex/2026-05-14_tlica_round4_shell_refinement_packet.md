# Mission Packet — TLICA Shell Refinement Preparation

## Mission

Prepare shell-refinement targets for real formalization without laundering deferred or placeholder mathematics as proof.

## Tasks

1. Inspect `TLICA/ProfileComparison/ShellRefinement.lean`.
2. Inventory existing shell definitions, theorem statements, and deferred markers.
3. Remove unused-variable warnings only if this does not alter mathematical content.
4. Replace `True` placeholders only when a precise source-faithful proposition is available.
5. Otherwise preserve the marker and label it `deferred_marker_not_theorem` or `statement_placeholder`.
6. Introduce shell-agreement predicates only if the source and current theorem family justify them.
7. Produce a proof-obligation report for remaining shell work.

## Non-goals

- Do not prove an underspecified theorem.
- Do not change source shell conventions.
- Do not formalize RCX, named affect taxonomy, stochastic projection, or phenomenological duration.

## Required outputs

- `reports/<timestamp>_tlica_shell_refinement_obligations.md`
- `reports/<timestamp>_tlica_shell_refinement_obligations.json`
