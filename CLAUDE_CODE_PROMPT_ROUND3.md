# Operating Brief for Claude Code — Round 3 (Profile-Comparison Apparatus)

## Context

Round 2 closed with a green build at mathlib v4.11.0: all five priority
theorems from the v0.3.2 milestone (Lemma 2.4.2, Proposition 3.3.7,
Proposition 2.5.1, Proposition 5.7.2, Theorem 6.5.1) are machine-verified.

Round 3 extends the project with the profile-comparison apparatus from
the v0.2 working paper (`profile_comparison_v0_2.md` in the diagnostics
trail of the v0.3.2 delivery package). Three new modules are added:

* `TLICA.Profile` — the `ScalarProfile` structure and zero-extension.
* `TLICA.ProfileComparison.Pointwise` — the `dInfShared` and `dInfUnion`
  distances with their pseudo-metric properties.
* `TLICA.ProfileComparison.ShellRefinement` — the shell-stratified
  bound, encoded at statement-placeholder level (full proof deferred).

The new modules add roughly six new theorems with substantive proofs and
a few placeholder declarations. The existing round-1 / round-2 modules
are unchanged.

## Your task

Apply this package as a new working tree (or unzip over the existing
round-2 tree, accepting overwrites). Run `lake build`. Report whether
the project compiles green, yellow, or red.

The expected outcome is yellow on the first attempt with a small number
of Category 1 (mathlib API drift) or Category 2 (typeclass inference)
issues, similar to the round 1 pattern. The substantive math has been
drafted carefully; the iteration in round 3 is anticipated to be of the
same character as round 1.

## Procedure

Step 1: ensure the round-2 environment is still in place. The toolchain
is pinned at `leanprover/lean4:v4.11.0` and mathlib is pinned at
`@ "v4.11.0"`.

```bash
cd /path/to/tlica-lean-round3   # the round-3 directory
elan show                          # confirm Lean v4.11.0
```

Step 2: build.

```bash
lake build
```

If the project compiles green on the first attempt, proceed to step 3.
If errors surface, apply the round 1/2 iteration protocol (categories
1–4 as defined in `CLAUDE_CODE_PROMPT.md`).

Step 3: confirm the type signatures of the new round-3 declarations.
The four most substantive are:

* `TLICA.ProfileComparison.Pointwise.dInfUnion_triangle` — the full
  triangle inequality for the union distance.
* `TLICA.ProfileComparison.Pointwise.dInfUnion_self` — reflexivity.
* `TLICA.ProfileComparison.Pointwise.dInfShared_top_iff` — `⊤` iff
  empty intersection.
* `TLICA.Profile.ScalarProfile.abs_sub_zeroExtend_le_one` — the [0,1]
  bound on pointwise differences.

## Specific guidance per new module

### `TLICA.Profile`

This module declares `ScalarProfile`, `zeroExtend`, and the basic
non-negativity / ≤ 1 / |·| ≤ 1 facts. Anticipated issues:

* The `zeroExtend` definition uses `dif_pos` / `dif_neg` for the
  branch elimination. If those are not the current names, the
  alternatives are `if_pos` / `if_neg` (for `if-then-else` on
  decidable propositions). Both should work given the `Decidable`
  instance on `x ∈ f.domain`.
* The `zeroExtend_nonneg` proof's `else` branch is `0 ≤ 0` which I
  closed with `le_refl`. If `le_refl` does not unify, use `rfl` or
  `Eq.le rfl`.

### `TLICA.ProfileComparison.Pointwise`

This module is the load-bearing addition. Anticipated issues:

* `iSup_le` and `le_iSup` are standard mathlib names; should be intact
  at v4.11.0.
* `ENNReal.ofReal_le_ofReal` is the monotonicity of `ofReal`; standard
  at v4.11.0.
* `ENNReal.ofReal_add` requires both arguments to be non-negative; the
  `abs_nonneg _` arguments supply this.
* The symmetry proof of `dInfShared_symm` rewrites the `Set.inter`
  commutativity. The `congr 1` steps to align iSup indexing may need
  adjustment depending on how the bounded `⨆ x ∈ S, f x` is elaborated.
  Specifically, `⨆ x ∈ S, f x` desugars to `⨆ x, ⨆ _ : x ∈ S, f x`,
  which has nested iSups. After `Set.inter_comm`, the membership
  conditions match but the structure of the iSup may need explicit
  rewriting via `iSup_congr` or `funext` plus `congr_arg`.
* The triangle inequality proof uses `add_le_add` applied to `le_iSup`
  twice. `add_le_add` is `OrderedAddCommMonoid.add_le_add` and should
  be intact.
* The `dInfShared_top_iff` proof's `by_contra` direction may need
  adjustment if the implicit type unification fails. If so, use an
  explicit cases on `(f.domain ∩ g.domain).Nonempty` instead.

### `TLICA.ProfileComparison.ShellRefinement`

This module declares `ShellThresholds`, `shellOf`, and placeholder
statements `shellStratifiedBound` and `shellStableDistanceVanishing`.
The placeholders have `True` bodies as in the original round-1
Dynamics skeleton; they should compile trivially.

Anticipated issues:

* `StrictAnti` from `Mathlib.Order.Antichain` or `Mathlib.Order.Defs`;
  should be standard at v4.11.0.
* `shellOf` is `noncomputable` because of the real-valued comparisons;
  if the function needs to be made computable for a downstream proof,
  use `Classical.dec` or similar.

## Error iteration protocol

Same as rounds 1 and 2. Apply category-1 (API drift), category-2
(typeclass), or category-3 (tactic divergence) fixes mechanically.
Escalate any category-4 (substantive logical) issue. Aim for at most
ten iteration cycles before escalation.

The proofs in round 3 are mathematically simpler than the M-test proof
of round 2; the most likely failure modes are nested iSup elaboration
(particularly in `dInfShared_symm`) and `ENNReal` API drift. If
`dInfShared_symm`'s `congr 1` chain does not close, replace the body
with a more explicit proof:

```
theorem dInfShared_symm (f g : ScalarProfile α) :
    dInfShared f g = dInfShared g f := by
  unfold dInfShared
  by_cases h : (f.domain ∩ g.domain).Nonempty
  · have h' : (g.domain ∩ f.domain).Nonempty := by
      rw [Set.inter_comm]; exact h
    rw [if_pos h, if_pos h']
    apply iSup_congr_set (Set.inter_comm f.domain g.domain)
    intro x hx
    rw [abs_sub_comm]
  · have h' : ¬ (g.domain ∩ f.domain).Nonempty := by
      rw [Set.inter_comm]; exact h
    rw [if_neg h, if_neg h']
```

(The above is a longer, more explicit version that may resolve a
`congr` failure if it occurs.)

## Reporting protocol

Same five sections as rounds 1 and 2:

1. Build status (green / yellow / red).
2. Iteration log (one line per iteration; expected to be short).
3. Type-check of the new round-3 priority declarations (the four named
   in step 3 above).
4. Modifications to source files (with old → new API name pairs).
5. Recommendations for the next round.

## What not to do

Do not modify the statements of any priority theorem from rounds 1, 2,
or 3. The statements encode the v0.3.2 substantive commitments and the
v0.2 working paper's foundation-ready definitions; changing them would
break the correspondence with the working paper.

Do not fill in the `shellStratifiedBound` or `shellStableDistanceVanishing`
proofs. Those are intentional placeholders for a future round.

Do not change the mathlib pin or the Lean toolchain pin.

## Begin

When ready, begin with step 1 of the procedure. Report the result of
`lake build` (step 2) before any error iteration.
