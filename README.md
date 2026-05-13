# TLICA — Lean 4 Formalization

Lean 4 / mathlib4 encoding of the priority proof-assistant targets of the
v0.3.1 rigorous edition of the formal apparatus of the Two-Layer
Identity-Correlation Architecture (TLICA, core architecture v5.3.3).

## What is encoded

Five priority targets identified by the second-round verification report
of the rigorous edition. Four are fully encoded with proofs; one is a
statement-only skeleton awaiting the final mathlib-API binding for
uniform convergence.

The full mapping from each Lean declaration to the corresponding location
in the v0.3.1 rigorous edition is documented in `MAPPING.md`.

| Target | Module | Status |
|---|---|---|
| Lemma 2.4.2 (strict ρ-bound, warm-up) | `TLICA.IntegrationGraph` | Machine-verified (round 1) |
| Proposition 3.3.7 (cogito as unique φ-supremum) | `TLICA.PhiCoordinate` | Machine-verified (round 1) |
| Proposition 2.5.1 (scalar mode aggregation) | `TLICA.ModeAggregation` | Machine-verified (round 1) |
| Proposition 5.7.2 (uniform convergence by M-test) | `TLICA.Dynamics` | Machine-verified (round 2) |
| Theorem 6.5.1 (formal non-reducibility, after v0.3.1 D_φ repair) | `TLICA.NonReducibility` | Machine-verified (round 1) |
| ScalarProfile structure, zero-extension | `TLICA.Profile` | Machine-verified (round 3) |
| L^∞ shared and union distances with pseudo-metric properties | `TLICA.ProfileComparison.Pointwise` | Machine-verified (round 3) |
| Shell same-shell bound + simplified stable-distance corollary | `TLICA.ProfileComparison.ShellRefinement` | Encoded with proofs (round 4); awaiting compile |
| PseudoEMetricSpace instance for `dInfUnion` | `TLICA.ProfileComparison.PseudoEMetric` | Encoded (round 4); awaiting compile |
| MSI structure with cogito-inclusion and density axioms | `TLICA.MSI` | Encoded (round 4); awaiting compile |
| Preservation-ranking Π with cogito-necessity and MSI-maximality axioms | `TLICA.PreservationRanking` | Encoded (round 4); awaiting compile |
| Prerogative of consistency (ConsistencyEval, PtCns structure) | `TLICA.PtCns` | Encoded (round 4); awaiting compile |
| Modes A, B, C as ModeOp with PtCns-triggered selection | `TLICA.Modes` | Encoded (round 4); awaiting compile |
| I/not-I boundary as derived structure | `TLICA.IBoundary` | Encoded (round 4); awaiting compile |
| Future-state projection map (deterministic) | `TLICA.ProjectMap` | Encoded (round 4); awaiting compile |
| Prerogative of continued existence (composite definition) | `TLICA.PCE` | Encoded (round 4); awaiting compile |

The architecture's coefficient field K, modeled as a linear ordered field
with a positive non-Archimedean infinitesimal δ, is encoded as the
`TLICA.KField` typeclass in `TLICA.Basic`.

## Project layout

```
tlica-lean/
├── lakefile.lean
├── lean-toolchain
├── README.md             (this file)
├── MAPPING.md            (declaration-to-rigorous-edition cross-reference)
├── CLAUDE_CODE_PROMPT.md (operating brief for Claude Code's compile-iteration)
├── TLICA.lean            (top-level import aggregator)
└── TLICA/
    ├── Basic.lean
    ├── IntegrationGraph.lean
    ├── PhiCoordinate.lean
    ├── ModeAggregation.lean
    ├── Dynamics.lean
    └── NonReducibility.lean
```

## How to build

This project depends on mathlib4. The recommended toolchain is pinned in
`lean-toolchain` to `leanprover/lean4:v4.11.0`; any reasonably recent
Lean 4 with a matching mathlib4 should work, with one caveat noted below.

```bash
# Install elan (the Lean version manager) if not already installed:
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y

# From the project root:
lake exe cache get   # fetches pre-built mathlib binaries (~5-15 min)
lake build           # compiles the project (~minutes after cache)
```

The `lake exe cache get` step is essential: without it, mathlib will
build from source, which can take 30+ minutes on a typical machine.

## Compilation status

This project was drafted in an environment without network access for
compilation verification. The source files are written carefully against
the current mathlib4 API (as of mathlib at the time of writing), but
have not been verified to compile. Anticipated places where the first
compile will surface issues:

1. **`tsum_le_tsum` argument order** in `TLICA.ModeAggregation`. The
   mathlib signature for this lemma has varied across versions; the
   current order is roughly `(h : ∀ i, f i ≤ g i) (hf : Summable f) (hg : Summable g)`,
   and the proof here passes them in that order. If mathlib has shifted,
   the proof needs argument reordering.

2. **`tsum_pos`** in `TLICA.ModeAggregation`. Likewise sensitive to
   mathlib version. Expected signature is
   `tsum_pos (hf : Summable f) (h_nonneg : ∀ i, 0 ≤ f i) (i : ι) (h_pos : 0 < f i) : 0 < ∑' j, f j`.

3. **`Summable.of_nonneg_of_le`**: this is the standard comparison test
   for summability. If mathlib has renamed it, the closest alternative
   is `Summable.of_nonneg_of_le` or `Summable.comparison`.

4. **`Mathlib.Algebra.Order.Field.Basic`** import path: stable in recent
   mathlib but may need adjustment.

5. **`TLICA.Dynamics`** is a statement-only skeleton. Once compilation is
   green for the other modules, the body of
   `mode_aggregation_uniform_convergent` should be filled in by replacing
   the placeholder `True` body with the actual mathlib uniform-convergence
   predicate (`TendstoUniformly` of partial sums to `tsum`) and proving
   via `tendstoUniformly_tsum` applied with majorant `u k := a k`.

The Claude Code prompt in `CLAUDE_CODE_PROMPT.md` documents the
compile-iteration protocol for closing these in a back-and-forth with
the project author.

## Provenance

The encoding work is part of the TLICA formalization project's transition
from hand-level rigorous editing to proof-assistant verification. The
verification cycle that established the v0.3.1 state is documented in:

- `prior_verification_report_v0_2.md` (first-round external verification)
- `prior_verification_report_v0_3.md` (second-round engagement-forcing verification)

Both reports are archived in the project's `diagnostics/` directory in
the v0.3.1 delivery package, alongside the rigorous edition itself.
