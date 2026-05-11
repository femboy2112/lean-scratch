/-
TLICA — Lean 4 formalization of the Two-Layer Identity-Correlation Architecture.

This module is the top-level entry point. It imports every encoded submodule.
The submodules track the priority ordering recommended by the second-round
verification report:

  1. TLICA.Basic              — The KField typeclass (apparatus coefficient field).
  2. TLICA.IntegrationGraph   — Lemma 2.4.2 (strict ρ-bound, warm-up).
  3. TLICA.PhiCoordinate      — Proposition 3.3.7 (cogito as unique supremum of φ).
  4. TLICA.ModeAggregation    — Proposition 2.5.1 (scalar mode aggregation). [SKELETON]
  5. TLICA.Dynamics           — Proposition 5.7.2 (uniform convergence). [SKELETON]
  6. TLICA.NonReducibility    — Theorem 6.5.1 (formal non-reducibility). [SKELETON]

The mapping from each Lean declaration to its location in the v0.3.1 rigorous
edition is recorded in `MAPPING.md` at the project root.
-/

import TLICA.Basic
import TLICA.IntegrationGraph
import TLICA.PhiCoordinate
import TLICA.ModeAggregation
import TLICA.Dynamics
import TLICA.NonReducibility
