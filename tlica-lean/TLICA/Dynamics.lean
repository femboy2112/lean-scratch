/-
TLICA.Dynamics — Apparatus dynamics lemmas.

This module is a skeleton for Proposition 5.7.2 of the v0.3.1 rigorous
edition: uniform convergence of the mode aggregation under the
Weierstrass M-test.

The proof strategy: the per-mode functions `ρ_k : Time → [0, 1]` are
uniformly bounded by `1`, and the weights `(a_k)` are summable, so by the
M-test the weighted sum `∑ k, a_k * ρ_k(t)` converges uniformly in `t`.

The full proof requires identifying the right mathlib API for uniform
convergence of series — likely `tendstoUniformly_tsum` or
`Summable.tendstoUniformly_of_norm_bound` — and matching the apparatus's
notion of "uniform in t" to mathlib's `TendstoUniformly`.

Reference: v0.3.1 rigorous edition,
  - 05_dynamics.md §5.7 (Proposition 5.7.2, uniform convergence).
-/

import TLICA.ModeAggregation
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Topology.UniformSpace.UniformConvergence
import Mathlib.Topology.UniformSpace.UniformConvergenceTopology

namespace TLICA.Dynamics

/-- **Proposition 5.7.2** (uniform convergence of the mode aggregation).

    Given a summable weighting `(a_k)` with `a_k ≥ 0` and a family of
    functions `ρ_k : T → ℝ` with `|ρ_k(t)| ≤ 1` for every `(k, t)`,
    the partial sums `∑_{k ∈ S} a_k · ρ_k(t)` converge uniformly in `t` as
    `S → ⊤` in the directed set of finite subsets.

    Reference: v0.3.1 rigorous edition, 05_dynamics.md §5.7. -/
theorem mode_aggregation_uniform_convergent
    {ι T : Type*} (a : ι → ℝ) (ρ : ι → T → ℝ)
    (ha_nonneg : ∀ k, 0 ≤ a k)
    (ha_sum : Summable a)
    (hρ_bound : ∀ k t, |ρ k t| ≤ 1) :
    -- Statement-level placeholder. The precise mathlib formulation of
    -- "uniform convergence of `∑ k, a k * ρ k t`" depends on whether we
    -- work with `tendstoUniformly`, `HasSum`, or `TendstoUniformlyOnFilter`.
    --
    -- The substantive content: by the Weierstrass M-test applied with
    -- majorant `M k = a k`, since each `|a k * ρ k t| ≤ a k` and `(a k)`
    -- is summable, the series of functions converges uniformly.
    True := by
  trivial
  -- TODO: replace `True` with the mathlib uniform-convergence predicate and
  -- prove via `Summable.tendstoUniformly_of_norm_bound` or analogous lemma.
  -- The M-test is mathlib's `tendstoUniformly_tsum`:
  --   theorem tendstoUniformly_tsum {f : β → α → F} {u : β → ℝ}
  --       (hu : Summable u) (hfu : ∀ n x, ‖f n x‖ ≤ u n) :
  --       TendstoUniformly (fun (t : Finset β) (x : α) => ∑ n ∈ t, f n x)
  --         (fun x => ∑' n, f n x) atTop
  -- We will instantiate this with f k t := a k * ρ k t and u k := a k.

end TLICA.Dynamics
