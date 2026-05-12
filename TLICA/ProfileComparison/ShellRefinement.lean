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

/-- Absolute index distance between the five interior shell indices. -/
def interiorShellIndexDistance (i j : Fin 5) : Nat :=
  if i.val ≤ j.val then j.val - i.val else i.val - j.val

/-- Interior-shell members are nonnegative under the current threshold
    convention. -/
theorem shellOf_nonneg (rs : ShellThresholds) (i : Fin 5) (a : ℝ)
    (ha : shellOf rs i a) : 0 ≤ a := by
  have hpos : 0 < rs.r ⟨i.val + 1, by omega⟩ := by
    by_cases htop : i.val + 1 = 5
    · simpa [htop] using rs.r_five_pos
    · have hlt : (⟨i.val + 1, by omega⟩ : Fin 6) < 5 := by
        simp [Fin.lt_iff_val_lt_val]
        omega
      have hgt := rs.r_strict_anti hlt
      linarith [rs.r_five_pos]
  exact le_trans hpos.le ha.1

/-- Interior-shell members are bounded above by the normalized top threshold. -/
theorem shellOf_le_one (rs : ShellThresholds) (i : Fin 5) (a : ℝ)
    (ha : shellOf rs i a) : a ≤ 1 := by
  have hle : rs.r ⟨i.val, by omega⟩ ≤ 1 := by
    by_cases hzero : i.val = 0
    · have hfin : (⟨i.val, by omega⟩ : Fin 6) = 0 := by
        ext
        simp [hzero]
      rw [hfin, rs.r_zero]
    · have hpos : (0 : Fin 6) < ⟨i.val, by omega⟩ := by
        simp [Fin.lt_iff_val_lt_val]
        omega
      have hlt := rs.r_strict_anti hpos
      linarith [rs.r_zero]
  exact le_trans ha.2.le hle

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

/-- Interior-shell naming bridge for the same-shell distance bound. -/
theorem sameInteriorShell_distance_bound
    (rs : ShellThresholds) (a b : ℝ) (i : Fin 5)
    (ha : shellOf rs i a) (hb : shellOf rs i b) :
    |a - b| < rs.r ⟨i.val, by omega⟩ - rs.r ⟨i.val + 1, by omega⟩ :=
  sameShellBound_of_shellOf rs a b i ha hb

/-- Conservative cross-interior-shell bound.

    Under the current interior-only shell predicate, every shell member lies in
    `[0, 1]`, so any two interior-shell values have distance at most `1`.
    This is weaker than the full shell-stratified estimate but does not require
    additional boundary-shell conventions. -/
theorem interiorShell_pair_bound
    (rs : ShellThresholds) (a b : ℝ) (i j : Fin 5)
    (ha : shellOf rs i a) (hb : shellOf rs j b) :
    |a - b| ≤ 1 := by
  have ha0 : 0 ≤ a := shellOf_nonneg rs i a ha
  have ha1 : a ≤ 1 := shellOf_le_one rs i a ha
  have hb0 : 0 ≤ b := shellOf_nonneg rs j b hb
  have hb1 : b ≤ 1 := shellOf_le_one rs j b hb
  rw [abs_sub_le_iff]
  constructor <;> linarith

/-- Deferred target marker for Proposition 5.3.1, the general
    shell-stratified bound.

    The general case requires a `Fin 7 × Fin 7` case analysis with boundary
    conventions for shells 0 (cogito) and 6 (outer). This is intentionally a
    non-substantive definition, not a theorem and not counted as
    machine-verified mathematics. -/
def shellStratifiedBound_deferred : Prop := True

/-- Profile-level shared-distance bound from an explicit pointwise bound.

    This theorem isolates the supremum step used by shell-stability corollaries:
    when all shared-domain pointwise zero-extension distances are bounded by a
    nonnegative real `B`, the shared `L∞` distance is bounded by `ofReal B`. -/
theorem shellStableDistanceBound_of_pointwise
    (f g : ScalarProfile α)
    (h_nonempty : (f.domain ∩ g.domain).Nonempty)
    (B : ℝ)
    (h_pointwise :
      ∀ x ∈ f.domain ∩ g.domain,
        |f.zeroExtend x - g.zeroExtend x| ≤ B) :
    dInfShared f g ≤ ENNReal.ofReal B := by
  unfold dInfShared
  rw [if_pos h_nonempty]
  apply iSup_le
  intro x
  apply iSup_le
  intro hx
  exact ENNReal.ofReal_le_ofReal (h_pointwise x hx)

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
