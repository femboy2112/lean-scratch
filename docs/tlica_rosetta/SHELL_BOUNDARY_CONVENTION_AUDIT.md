# Shell Boundary Convention Audit

Scope: source and Rosetta audit for the full shell-stratified bound. This audit
uses the source corpus, the profile-comparison working paper, the rigorous
edition shell definition, and the current Lean module
`TLICA/ProfileComparison/ShellRefinement.lean`.

## Summary

The seven-shell scalar convention is source-fixed in the rigorous edition:

- Shell 0 is the cogito singleton.
- Shells 1-5 are half-open intervals `[r_i, r_(i-1))`.
- Shell 6 is the outer interval `[0, r_5)`.
- Strict not-I is the exact-zero subset, not a separate shell.
- The full pointwise shell-stratified bound uses endpoint conventions
  `r_(-1) = 1` and `r_6 = 0`.

The current branch encoded these conventions additively in Lean as `ShellIndex7`,
`shellOf7`, endpoint functions, helper lemmas, and `fullShellStratifiedBound`.
Existing interior `shellOf` over `Fin 5` remains unchanged.

## Convention Table

| Convention | Classification | Evidence | Lean status |
|---|---|---|---|
| Threshold chain `1 = r_0 > r_1 > ... > r_5 > 0` | source-fixed | `04_profiles.md` Definition 4.3.1; `profile_comparison_v0_2.md` Proposition 5.3.1 | `ShellThresholds` |
| Shell 0 is the cogito singleton `{i_hat_m}` | source-fixed | `04_profiles.md` Definition 4.3.1 | `ShellIndex7.cogito`, `shellOf7 ... = a = 1` |
| Shells 1-5 are `[r_i, r_(i-1))` | source-fixed | `04_profiles.md` Definition 4.3.1; `profile_comparison_v0_2.md` proof of Proposition 5.3.1 | Existing `shellOf` and `ShellIndex7.interior` |
| Shell 6 is `[0, r_5)` | source-fixed | `04_profiles.md` Definition 4.3.1 | `ShellIndex7.outer`, `shellOf7_outer_bound` |
| Strict not-I is exact zero | source-fixed | `04_profiles.md` §4.3.2; core file 4 §10.3 | Not a new shell; documented as subset of shell 6 |
| Core/asymptotic-field values lie in `[0,1]`, with `1` only at cogito | source-fixed | `03_coordinates.md` §3.2; `04_profiles.md` Definition 4.1.1; core file 5 appendix | `shellOf7_mem_Icc_zero_one` for shell predicates |
| Endpoint inclusivity | source-fixed for scalar shells | `04_profiles.md` partition proof: `[r_1,1)`, ..., `[0,r_5)` plus singleton `{1}` | Encoded by `shellOf7`; upper half-open converted to `≤` for endpoint bound |
| Boundary endpoint convention `r_(-1)=1`, `r_6=0` for Proposition 5.3.1 | source-fixed in working paper | `profile_comparison_v0_2.md` Proposition 5.3.1 | `shellLowerEndpoint`, `shellUpperEndpoint` |
| Shell distance terminology | source-suggested | Working paper uses endpoint max bound rather than a standalone categorical shell-distance function | Lean proves endpoint bound, not a separate categorical distance theorem |
| Profile-level full shell-stable corollary over `dInfShared` | Lean-inferred next step | Follows from pointwise theorem plus `shellStableDistanceBound_of_pointwise`, but requires a chosen pointwise bound family over shared contents | Not added in this branch |

## Theorem Status

Machine-verified in this branch:

- `ShellIndex7`
- `shellLowerEndpoint`
- `shellUpperEndpoint`
- `shellOf7`
- `shellOf7_lower_le`
- `shellOf7_le_upper`
- `shellOf7_mem_Icc_zero_one`
- `shellOf7_cogito_value`
- `shellOf7_outer_bound`
- `sameCogitoShell_bound`
- `sameOuterShell_bound`
- `abs_sub_le_max_endpoint_abs`
- `fullShellStratifiedBound`

The legacy marker `shellStratifiedBound_deferred` remains only as a compatibility
marker for older documentation. It is superseded at the pointwise scalar level
by `fullShellStratifiedBound`.

## Remaining Work

The remaining work is no longer a source-level boundary blocker. It is a
profile-level packaging question: choose whether the next exported theorem
should bound `dInfShared`, `dInfUnion`, or a shell-count/topological invariant,
and how to present a shared-domain pointwise shell assignment hypothesis.
