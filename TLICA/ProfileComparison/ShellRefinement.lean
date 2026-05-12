/-
TLICA.ProfileComparison.ShellRefinement — Shell-stratified distance bounds.

This module encodes Proposition 5.3.1 and Corollary 5.3.2 of the v0.2
profile-comparison working paper. Round 3 declared statement placeholders
(`True` bodies); round 4 replaces them with substantive theorem signatures
and proves the tractable cases.

The strategy: prove the same-shell bound (`sameShellBound`) as the
load-bearing tractable case. The general `shellStratifiedBound` requires a
case analysis on `Fin 7 × Fin 7` and is left as a TODO. The downstream
corollary `shellStableDistanceVanishing_simple` is derivable from
`sameShellBound` under the single-shell hypothesis.

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

/-- **Proposition 5.3.1 statement** (shell-stratified bound, general case).

    The general case requires a `Fin 7 × Fin 7` case analysis with boundary
    conventions for shells 0 (cogito) and 6 (outer). Left as TODO for round 5;
    statement skeleton retained so downstream theorems can reference. -/
theorem shellStratifiedBound_TODO (_rs : ShellThresholds)
    (a b : ℝ) (_ha_unit : 0 ≤ a ∧ a ≤ 1) (_hb_unit : 0 ≤ b ∧ b ≤ 1) :
    True := by
  trivial

/-- **Corollary 5.3.2 simplified** (shell-stable distance vanishing).

    If two profiles `f` and `g` have all shared-subdomain values in a
    single shell `i`, then `dInfShared f g` is bounded above by the
    shell's gap. -/
theorem shellStableDistanceVanishing_simple
    (rs : ShellThresholds) (f g : ScalarProfile α) (i : Fin 5)
    (h_nonempty : (f.domain ∩ g.domain).Nonempty)
    (h_f_in_shell : ∀ x ∈ f.domain ∩ g.domain,
      ∀ h : x ∈ f.domain,
        rs.r ⟨i.val + 1, by omega⟩ ≤ f.toFun ⟨x, h⟩ ∧
        f.toFun ⟨x, h⟩ < rs.r ⟨i.val, by omega⟩)
    (h_g_in_shell : ∀ x ∈ f.domain ∩ g.domain,
      ∀ h : x ∈ g.domain,
        rs.r ⟨i.val + 1, by omega⟩ ≤ g.toFun ⟨x, h⟩ ∧
        g.toFun ⟨x, h⟩ < rs.r ⟨i.val, by omega⟩) :
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
    · obtain ⟨hfa, hfb⟩ := h_f_in_shell x hx hfx
      obtain ⟨hga, hgb⟩ := h_g_in_shell x hx hgx
      rw [f.zeroExtend_of_mem x hfx, g.zeroExtend_of_mem x hgx]
      have h_bound : |f.toFun ⟨x, hfx⟩ - g.toFun ⟨x, hgx⟩| <
                     rs.r ⟨i.val, by omega⟩ - rs.r ⟨i.val + 1, by omega⟩ :=
        sameShellBound rs _ _ i hfa hfb hga hgb
      apply ENNReal.ofReal_le_ofReal
      linarith
    · exact absurd hx.2 hgx
  · exact absurd hx.1 hfx

end TLICA.ProfileComparison.ShellRefinement
