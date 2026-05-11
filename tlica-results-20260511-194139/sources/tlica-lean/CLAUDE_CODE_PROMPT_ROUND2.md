# Operating Brief for Claude Code — Round 2 (Dynamics Completion)

## Context

Round 1 closed with a green-yellow build at mathlib v4.11.0: four of five
priority theorems were machine-verified, and the fifth
(`TLICA.Dynamics.mode_aggregation_uniform_convergent`) was a
statement-only skeleton with a `True`-typed placeholder body. This
round-2 package fills in the Dynamics body with the actual Weierstrass
M-test proof via `tendstoUniformly_tsum`, which round-1's report
confirmed is intact at v4.11.0 in `Mathlib.Analysis.NormedSpace.FunctionSeries`.

All round-1 patches you applied are already baked into this package:
the lakefile mathlib pin at `@ "v4.11.0"`, the `NormCast → NormNum`
import substitution in `TLICA/Basic.lean` and `TLICA/PhiCoordinate.lean`,
the `NormedSpace.Basic → Normed.Module.Basic` rename in
`TLICA/ModeAggregation.lean` and `TLICA/Dynamics.lean`, the
`Mathlib.Topology.Instances.ENNReal` import in `TLICA/ModeAggregation.lean`,
the type-ascription patches in `δ_lt_half` and `cogito_unique_phi_supremum`
and `witness_phi_2.φ_in_DPhi`, the `Mathlib.Data.Real.Basic` import in
`TLICA/NonReducibility.lean`, and the `noncomputable` annotations on all
six witness definitions.

## Your task

Apply this package over the existing `tlica-lean/` working tree (or use
it as a fresh checkout). Run `lake build`. Report whether the Dynamics
completion compiles green, yellow, or red.

## Procedure

Step 1: drop the new project on top of the existing checkout.

```bash
# If you have the round-1 working tree:
cd /path/to/tlica-lean
# Unzip the new package over the top, accepting overwrites:
unzip -o ../tlica-lean-round2.zip

# Or, for a fresh checkout, just unzip into a new directory.
```

Step 2: rebuild. Mathlib is already pinned at v4.11.0, so no cache
re-fetch should be needed if you are in the same environment as round 1.

```bash
lake build
```

Expected outcome: green build with no warnings. The Dynamics module's
three previously-unused-variable lints (for `ha_nonneg`, `ha_sum`, and
`hρ_bound`) should now all be used in the M-test proof, eliminating the
yellow.

Step 3: confirm the type signature of the completed theorem.

```bash
# In a scratch file or interactive session:
#check @TLICA.Dynamics.mode_aggregation_uniform_convergent
```

The new signature should be (roughly):

```
@TLICA.Dynamics.mode_aggregation_uniform_convergent :
  ∀ {ι : Type u_1} {T : Type u_2} (a : ι → ℝ) (ρ : ι → T → ℝ),
    (∀ (k : ι), 0 ≤ a k) → Summable a →
    (∀ (k : ι) (t : T), |ρ k t| ≤ 1) →
    TendstoUniformly
      (fun (s : Finset ι) (t : T) => ∑ k ∈ s, a k * ρ k t)
      (fun (t : T) => ∑' (k : ι), a k * ρ k t)
      Filter.atTop
```

Note that the return type has changed from `True` to the actual
`TendstoUniformly` conclusion.

## If the build fails

The new Dynamics proof uses these mathlib APIs:

- `tendstoUniformly_tsum` (in `Mathlib.Analysis.NormedSpace.FunctionSeries`)
- `Real.norm_eq_abs`
- `abs_mul`
- `abs_of_nonneg`
- `abs_nonneg`
- `nlinarith`

Round 1's report confirmed all of these names at v4.11.0. If any has
nevertheless shifted in a more recent mathlib commit, the iteration
protocol from round 1 applies. The most likely category-1 issue would
be the `tendstoUniformly_tsum` import path, which may have moved if the
NormedSpace directory restructuring extended further; if so, locate the
lemma with `grep -rn "tendstoUniformly_tsum" $(lake env printenv MATHLIB_PATH 2>/dev/null || echo lake-packages/mathlib)`
and adjust the import.

If `nlinarith` fails to close the final goal, the explicit form is:

```lean
  have h_bound : |ρ k t| ≤ 1 := hρ_bound k t
  have h_abs_nonneg : 0 ≤ |ρ k t| := abs_nonneg _
  have h_a_nonneg : 0 ≤ a k := ha_nonneg k
  calc a k * |ρ k t| ≤ a k * 1 := by
        exact mul_le_mul_of_nonneg_left h_bound h_a_nonneg
    _ = a k := by ring
```

Substitute that calc block in place of the `nlinarith [ha_nonneg k]` line
if needed.

## Reporting

Report the build status and the type signature of
`mode_aggregation_uniform_convergent` once it compiles. If the build is
clean and warning-free, also confirm that the previously-yellow round-1
warnings on `TLICA.Dynamics` are gone. No iteration log is needed unless
errors surfaced. Branch nomenclature: continue from
`claude/tlica-lean-compilation-WWXY9` or use a fresh feature branch
`claude/tlica-lean-round2-dynamics` at your discretion.

## What not to do

Do not modify the statements of any of the priority theorems. Do not
change the project structure, the mathlib pin, or the toolchain pin.
This round is a focused completion pass on `TLICA.Dynamics` only.
