# Operating Brief for Claude Code — TLICA Lean Project Compilation

## A. Your role

You are acting as the proof-assistant operator for the TLICA Lean
formalization project. Your task is to install the Lean toolchain, fetch
mathlib4 via the pre-built binary cache, compile the project, and report
back. If the first compile is not clean, you will iterate on errors until
either the project compiles green, or you reach an error that requires
substantive mathematical input from the project author (in which case you
will document the error precisely and stop).

The project formalizes five priority targets from the v0.3.1 rigorous
edition of the Two-Layer Identity-Correlation Architecture, identified
by a second-round external verification report as the natural next phase
of work after the hand-level rigorous edition was completed. The targets
and their current encoding status are documented in `README.md` and
`MAPPING.md`. You should read both before starting compilation work.

## B. Setup procedure

Step 1: install elan if it is not already installed.

```bash
which elan || curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y
source ~/.profile 2>/dev/null || source ~/.bashrc 2>/dev/null || true
```

Step 2: confirm Lean is available at the pinned version.

```bash
cd /path/to/tlica-lean
elan show
lean --version
```

The toolchain pin in `lean-toolchain` should be honored automatically.
If the pin is unavailable, fall back to the most recent stable Lean 4
that has a matching mathlib4 release; report the substitution to the
project author.

Step 3: fetch the mathlib binary cache.

```bash
lake exe cache get
```

This should take five to fifteen minutes. If it fails, check whether
the project's mathlib dependency in `lakefile.lean` is pinned to a
specific commit or floats on master; either is acceptable, but a pinned
commit is preferable for reproducibility.

Step 4: attempt the first compile.

```bash
lake build
```

Report the result of this first compile to the project author before
proceeding to any error iteration. If the first compile is clean, the
substantive work is done and you should stop after step 5 below.

Step 5: if the first compile is clean, run a sanity check by displaying
the type signatures of the five priority theorems:

```bash
echo "import TLICA" | lake env lean --stdin
# (or use `#check` statements in a scratch file)
```

The five theorems whose successful type-checking constitutes verification
of the priority targets are, in order:

1. `TLICA.IntegrationGraph.strict_rho_bound` (Lemma 2.4.2)
2. `TLICA.PhiCoordinate.phi_tier3_lt_phiCogito` (Proposition 3.3.7)
3. `TLICA.ModeAggregation.mode_aggregation_lt_one` (Proposition 2.5.1 (iii))
4. `TLICA.Dynamics.mode_aggregation_uniform_convergent` (Proposition 5.7.2)
5. `TLICA.NonReducibility.formal_non_reducibility` (Theorem 6.5.1)

Report the successful type-check of each. Note that target 4 is currently
a statement-level skeleton with a `True`-typed placeholder body, so a
successful type-check there confirms only that the statement is
well-typed, not that the proof is complete. The other four targets carry
genuine proofs whose type-check is the verification.

## C. Error iteration protocol

If `lake build` reports errors, iterate as follows.

For each error, identify which of the following categories it falls into.

The first category is **mathlib API drift**: a lemma name, argument
order, or import path has changed between the mathlib version the code
was drafted against and the version currently installed. Resolve by
finding the current mathlib lemma that does what the proof needs, and
adjusting the proof's invocation. The README documents the specific
places where API drift is most likely (`tsum_le_tsum`, `tsum_pos`,
`Summable.of_nonneg_of_le`, and the `Mathlib.Algebra.Order.Field.Basic`
import path).

The second category is **typeclass resolution**: a typeclass instance
that the proof needs is not found, usually because of an unstated
hypothesis or a missing `[DecidableEq ι]` or similar. Resolve by adding
the missing instance hypothesis.

The third category is **tactic divergence**: a tactic (`linarith`,
`nlinarith`, `norm_num`, `positivity`) does not close a goal that the
proof author intended it to close. Resolve by either supplying additional
hypotheses as hints (e.g. `linarith [δ_pos, hε]`), refactoring the proof
to a more granular sequence of `have` statements, or replacing the
tactic with `omega`, `decide`, or an explicit term proof. Report the
specific goal that the tactic failed on so the project author can
sanity-check that the goal is in fact true.

The fourth category is **substantive logical issue**: the proof is
genuinely incorrect or the statement is not provable from the imported
hypotheses. Do *not* attempt to repair these silently. Stop iteration,
document the issue with the file, the line, the goal at the failure
point, and your assessment, and report back to the project author for
substantive input.

Iterate through the first three categories until no errors remain or you
hit a category-four issue. Aim for at most ten iteration cycles before
escalating; if you have iterated ten times and the build is still not
clean, the residual issues likely require project-author input even if
no individual one is a category-four problem.

## D. Specific guidance per module

`TLICA.Basic`: the KField typeclass should compile out of the box. The
`δ_lt_half` lemma may need adjustment if `norm_num` does not close the
casting goal cleanly; in that case, a `show (1/2 : K) = ((1/2 : ℚ) : K)`
intermediate step usually helps.

`TLICA.IntegrationGraph`: should compile out of the box; the proofs are
two-line linarith reductions.

`TLICA.PhiCoordinate`: should compile out of the box. The `phi_tier3_le_phiCogito`
proof uses `mul_le_mul_of_nonneg_right`; if mathlib has renamed this, the
likely current names are `mul_le_mul_of_nonneg_right` (unchanged), or
`mul_le_mul_right'` for the order-class version. The `δ_lt_half` lemma
is invoked here via `δ_lt_half (K := K)`.

`TLICA.ModeAggregation`: most likely module to surface API drift. Watch
for `Summable.of_nonneg_of_le` (may be named differently), `tsum_le_tsum`
(argument order), `tsum_pos` (argument order), and `tsum_sub` (which
requires both `Summable f` and `Summable g`). If any of these fail,
search mathlib for the current names with `grep -r "theorem.*tsum_le_tsum"`
in the mathlib source.

`TLICA.Dynamics`: a statement-level skeleton. The current placeholder
body is `trivial` against goal `True`, which should compile. Do not
attempt to fill in the actual M-test proof during this compilation
cycle; that is project-author work for the next round.

`TLICA.NonReducibility`: the witness constructions use `norm_num` for
the rational-arithmetic side conditions and `linarith` for the
δ-involving inequalities. The proof of `no_F_phi` is the most subtle
because it uses the v0.3.1 `D_φ` repair (the `witness_phi_2` φ-value
`1 - 2·δ - 1/2` is not of the form `1 - δ - r` for real `r`). The
proof's final `linarith` step depends on `δ_pos`; if the witness
unfolding does not bring `δ_pos` into scope, add `have hδ : (0 : K) < δ := KField.δ_pos`
explicitly before the `linarith` call.

## E. Reporting protocol

After the build is clean (or after you escalate a category-four issue),
report to the project author with the following sections:

1. **Build status**: green, yellow (clean compile but with warnings), or
   red (with the residual issue if escalated).

2. **Iteration log**: a brief summary of the iterations applied, with one
   line per iteration describing the file, the error category, and the
   fix.

3. **Type-check of priority theorems**: confirmation that each of the
   five priority theorems type-checks successfully, with the displayed
   type signatures.

4. **Modifications to source files**: a summary of all changes you made
   to the project source. Where mathlib API names were updated, list
   both the old name and the current one.

5. **Recommendations for next iteration**: if `TLICA.Dynamics` is still a
   skeleton, this is the natural next target. If any of the proofs
   compile but with warnings (`linter` complaints, unused hypotheses),
   suggest a clean-up pass.

## F. What not to do

Do not modify the statements of the priority theorems. The statements
encode the v0.3.1 rigorous edition's substantive commitments, and
changing them would break the correspondence with the rigorous edition.
Only the proofs (and where needed, helper lemmas and imports) should be
edited during compilation iteration.

Do not silently fill in `TLICA.Dynamics.mode_aggregation_uniform_convergent`.
That target is intentionally left as a skeleton; its completion is the
subject of the next encoding round, not this one.

Do not switch the project from `lake` to any other build system. The
`lakefile.lean` structure is the standard for Lean 4 / mathlib4 and
should be retained.

Do not pin to a different Lean version than the one in `lean-toolchain`
unless that version is genuinely unavailable. If you do need to
substitute, choose the most recent stable Lean 4 with a matching
mathlib4 and document the substitution.

## G. Begin

When ready, begin with step 1 of the setup procedure (section B).
Report the result of `lake build` (step 4) before doing any error
iteration. Then proceed per the iteration protocol.
