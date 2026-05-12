/-
TLICA.ProfileComparison.ShellRefinement — Shell-stratified distance bounds.

This module encodes tractable shell-stratified distance bounds from Proposition
5.3.1 and Corollary 5.3.2 of the v0.2 profile-comparison working paper.

The strategy: prove the same-shell bound (`sameShellBound`) as the
load-bearing tractable case. The general `shellStratifiedBound` requires more
source-grounded boundary conventions for shell 0 (cogito) and shell 6 (outer),
so it is recorded as an explicit deferred target rather than as a theorem.
The downstream corollary `shellStableDistanceVanishing_simple` is derivable
from `sameShellBound` under the single-shell hypothesis.

Reference: v0.3.1 rigorous edition + profile_comparison_v0_2.md,
  - 04_profiles.md §4.3.1 (shell stratification).
  - profile_comparison_v0_2.md §5.3 (Proposition 5.3.1, Corollary 5.3.2).
-/

import TLICA.ProfileComparison.Pointwise
import Mathlib.Tactic.Linarith

namespace TLICA.ProfileComparison.ShellRefinement

open TLICA.Profile TLICA.ProfileComparison.Pointwise
open Classical

variable {α : Type*}

/-- A strictly-decreasing threshold sequence for the shell partition. -/
structure ShellThresholds where
  r : Fin 6 → ℝ
  r_zero : r 0 = 1
  r_five_pos : 0 < r 5
  r_strict_anti : StrictAnti r

namespace ShellThresholds

variable (rs : ShellThresholds)

/-- The maximal gap between adjacent thresholds across the partition. -/
noncomputable def maxGap : ℝ :=
  max (rs.r 0 - rs.r 1)
    (max (rs.r 1 - rs.r 2)
      (max (rs.r 2 - rs.r 3)
        (max (rs.r 3 - rs.r 4) (rs.r 4 - rs.r 5))))

/-- Every adjacent-threshold gap is positive. -/
theorem adjacent_gap_pos (i : Fin 5) :
    0 < rs.r ⟨i.val, by omega⟩ - rs.r ⟨i.val + 1, by omega⟩ := by
  have h : (⟨i.val, by omega⟩ : Fin 6) < ⟨i.val + 1, by omega⟩ := by
    simp [Fin.lt_iff_val_lt_val]
  have := rs.r_strict_anti h
  linarith

end ShellThresholds

/-- Membership in shell `i`, represented as the half-open interval
    `[r_(i+1), r_i)`.

    This covers the five interior shells determined directly by the six
    encoded thresholds. Boundary shells 0 and 6 from the prose source need
    additional conventions and are not included in this predicate. -/
def shellOf (rs : ShellThresholds) (i : Fin 5) (a : ℝ) : Prop :=
  rs.r ⟨i.val + 1, by omega⟩ ≤ a ∧ a < rs.r ⟨i.val, by omega⟩

/-- **Same-shell bound** (the tractable load-bearing case of Proposition 5.3.1).

    If two profile values `a, b` both lie in the half-open interval
    `[r_(i+1), r_i)` for the same shell index, then their distance is
    strictly bounded by the shell's gap. -/
theorem sameShellBound (rs : ShellThresholds) (a b : ℝ)
    (i : Fin 5)
    (ha_lower : rs.r ⟨i.val + 1, by omega⟩ ≤ a)
    (ha_upper : a < rs.r ⟨i.val, by omega⟩)
    (hb_lower : rs.r ⟨i.val + 1, by omega⟩ ≤ b)
    (hb_upper : b < rs.r ⟨i.val, by omega⟩) :
    |a - b| < rs.r ⟨i.val, by omega⟩ - rs.r ⟨i.val + 1, by omega⟩ := by
  rcases le_or_lt a b with hab | hab
  · rw [abs_of_nonpos (by linarith)]
    linarith
  · rw [abs_of_pos (by linarith)]
    linarith

/-- Same-shell bound stated through the `shellOf` predicate. -/
theorem sameShellBound_of_shellOf (rs : ShellThresholds) (a b : ℝ)
    (i : Fin 5) (ha : shellOf rs i a) (hb : shellOf rs i b) :
    |a - b| < rs.r ⟨i.val, by omega⟩ - rs.r ⟨i.val + 1, by omega⟩ :=
  sameShellBound rs a b i ha.1 ha.2 hb.1 hb.2

/-- Deferred target marker for Proposition 5.3.1, the general
    shell-stratified bound.

    The general case requires a `Fin 7 × Fin 7` case analysis with boundary
    conventions for shells 0 (cogito) and 6 (outer). This is intentionally a
    non-substantive definition, not a theorem and not counted as
    machine-verified mathematics. -/
def shellStratifiedBound_deferred : Prop := True

/-- **Corollary 5.3.2 simplified** (shell-stable distance vanishing).

    If two profiles `f` and `g` have all shared-subdomain values in a
    single shell `i`, then `dInfShared f g` is bounded above by the
    shell's gap. -/
theorem shellStableDistanceVanishing_simple
    (rs : ShellThresholds) (f g : ScalarProfile α) (i : Fin 5)
    (h_nonempty : (f.domain ∩ g.domain).Nonempty)
    (h_f_in_shell : ∀ x ∈ f.domain ∩ g.domain,
      ∀ h : x ∈ f.domain,
        shellOf rs i (f.toFun ⟨x, h⟩))
    (h_g_in_shell : ∀ x ∈ f.domain ∩ g.domain,
      ∀ h : x ∈ g.domain,
        shellOf rs i (g.toFun ⟨x, h⟩)) :
    dInfShared f g ≤
      ENNReal.ofReal (rs.r ⟨i.val, by omega⟩ - rs.r ⟨i.val + 1, by omega⟩) := by
  unfold dInfShared
  rw [if_pos h_nonempty]
  apply iSup_le
  intro x
  apply iSup_le
  intro hx
  by_cases hfx : x ∈ f.domain
  · by_cases hgx : x ∈ g.domain
    · have hf_shell := h_f_in_shell x hx hfx
      have hg_shell := h_g_in_shell x hx hgx
      rw [f.zeroExtend_of_mem x hfx, g.zeroExtend_of_mem x hgx]
      have h_bound : |f.toFun ⟨x, hfx⟩ - g.toFun ⟨x, hgx⟩| <
                     rs.r ⟨i.val, by omega⟩ - rs.r ⟨i.val + 1, by omega⟩ :=
        sameShellBound_of_shellOf rs _ _ i hf_shell hg_shell
      apply ENNReal.ofReal_le_ofReal
      linarith
    · exact absurd hx.2 hgx
  · exact absurd hx.1 hfx

end TLICA.ProfileComparison.ShellRefinement
