# Operating Brief for Claude Code — Round 4 (Foundation Orphan Cluster + Round-3 Completion)

## Context

Round 3 closed yellow (green build with intentional skeleton warnings). The five v0.3.2 priority theorems plus the round-3 profile-comparison apparatus are machine-verified. Round 3's iteration report identified specific fixes that I have *now applied to the round-4 baseline* — so this round-4 zip should not regress those fixes (which round 3 did with Dynamics.lean).

Round 4 has two phases:

* **Phase 1 (round-3 follow-up)**: complete the `ShellRefinement` placeholders with real theorem statements and proofs (the same-shell case is fully proved; the general case has a TODO placeholder); add a `PseudoEMetricSpace` instance on top of the round-3 `dInfUnion` proofs.

* **Phase 2 (foundation orphan cluster)**: seven new modules encoding the orphan cluster from the `orphan_cluster_v0_1.md` working paper — MSI, PreservationRanking, PtCns, Modes, IBoundary, ProjectMap, PCE. The cluster is encoded at the foundation-default level (structure + axioms + simple derived facts); functional-form refinement is left to applications.

## Your task

Apply this package as a new working tree (or unzip over the existing
round-3 tree, accepting overwrites). Run `lake build`. Report whether
the project compiles green, yellow, or red.

The expected outcome is yellow on the first attempt with a moderate
number of Category 1 (mathlib API drift) or Category 2 (typeclass
inference) issues, similar to round 3's pattern. The new content
draws on simpler mathlib API than round 3's M-test or ENNReal
juggling, so iteration count should be comparable to round 3 or
slightly lower.

## Procedure

Step 1: confirm the toolchain.

```bash
cd /path/to/tlica-lean-round4
elan show                          # confirm Lean v4.11.0
```

Step 2: build.

```bash
lake build
```

If errors surface, apply the round 1/2/3 iteration protocol
(categories 1–4 as defined in `CLAUDE_CODE_PROMPT.md`).

Step 3: confirm the type signatures of the new round-4 declarations.
The most substantive are:

* `TLICA.ProfileComparison.ShellRefinement.sameShellBound` — within-shell
  distance bound (full proof).
* `TLICA.ProfileComparison.ShellRefinement.shellStableDistanceVanishing_simple`
  — application of `sameShellBound` to dInfShared.
* `TLICA.ProfileComparison.PseudoEMetric.instance` — PseudoEMetricSpace
  promotion.
* `TLICA.MSI.MSI.mem_msi_positive` — every MSI member has positive ρ.
* `TLICA.PreservationRanking.PreservationRanking.no_cogito_zero_rank` —
  derived from cogito-necessity axiom.
* `TLICA.PtCns.PtCns.partition_disjoint` — three-way disjointness of
  evaluation classes.
* `TLICA.Modes.ModeOp.cogito_triggers_modeC` — Mode C is triggered for the
  cogito (combines PtCns invariance with ModeOp.fromEval).
* `TLICA.PCE.PCE.bounded_by_msi_max` — PCE bounded by Π at MSI.

## Specific guidance per new module

### Phase 1, Module A: `TLICA/ProfileComparison/ShellRefinement.lean` (updated)

Replaces the round-3 placeholder with substantive content. Anticipated
issues:

* The `Fin 6` index arithmetic uses `omega` for bounds. `omega` is at
  v4.11.0 mathlib and should be intact.
* `StrictAnti` is from `Mathlib.Order.Monotone.Basic`; if not transitively
  imported, add `import Mathlib.Order.Monotone.Basic`.
* The `sameShellBound` proof uses `rcases le_or_lt a b with` — standard
  mathlib pattern.
* The `shellStableDistanceVanishing_simple` proof has nested `iSup_le`;
  this should be tractable since the round-3 work already exercised the
  pattern.
* If `zeroExtend_of_mem` is not the exact lemma name, use
  `f.zeroExtend_of_mem x hfx` or whatever the round-3 binding shows.

### Phase 1, Module B: `TLICA/ProfileComparison/PseudoEMetric.lean` (new)

Promotes `dInfUnion` to a `PseudoEMetricSpace` instance. Anticipated
issues:

* The `PseudoEMetricSpace` class is in `Mathlib.Topology.EMetricSpace.Basic`;
  if relocated at v4.11.0, the alternative location is
  `Mathlib.Topology.MetricSpace.PseudoMetric`.
* The instance fields are `edist`, `edist_self`, `edist_comm`, `edist_triangle`;
  these are the only ones required for the *pseudo*-emetric class. If a
  field was renamed (e.g. to `edist_eq_self`), update accordingly.
* The `ProfileSpace α := ScalarProfile α` definition uses type-level
  aliasing; if Lean complains about coercions, use a wrapper struct
  instead: `structure ProfileSpace (α : Type*) where unwrap : ScalarProfile α`.

### Phase 2, Module C: `TLICA/MSI.lean` (new)

The MSI structure with cogito-inclusion, density, and the cogito-value
field. Anticipated issues:

* `cogito : ↥profile.domain` — the `↥` coercion to subtype. If Lean
  complains, use `Subtype profile.domain` explicitly.
* The `density` axiom uses `x ≠ cogito` — the `≠` on subtype values
  should work; if not, use `(x : α) ≠ cogito.val` after extracting
  the underlying values.
* `mem_msi_positive`'s `by_cases` then `calc` — straightforward.

### Phase 2, Module D: `TLICA/PreservationRanking.lean` (new)

The Π structure with five axioms. Anticipated issues:

* The `rank` field is `Set ↥msi.profile.domain → ℝ`. If Lean complains
  about the implicit `Set α` over a subtype, the explicit form is
  `rank : Set (↥msi.profile.domain) → ℝ`.
* The `cogito_necessity` axiom uses `0 < rank S → msi.cogito ∈ S`. This
  encodes "rank-positive sets contain the cogito"; the contrapositive
  is in `no_cogito_zero_rank`.
* `msi_monotonicity`'s `S ∩ T` is a `Set` intersection, well-typed.

### Phase 2, Module E: `TLICA/PtCns.lean` (new)

The `ConsistencyEval` inductive type and the PtCns structure. Anticipated
issues:

* The `DecidableEq, Repr` derives should be intact at v4.11.0; if not,
  remove and Lean will infer them.
* The three `cogito_*` theorems use `simp [Set.mem_setOf_eq, ...]` —
  standard.
* The `partition_disjoint` theorem uses `cases h2` to derive False from
  contradictory `ConsistencyEval` equalities; this works because
  `ConsistencyEval` is an inductive with distinct constructors.

### Phase 2, Module F: `TLICA/Modes.lean` (new)

The `ModeOp` inductive type with `fromEval` function. Anticipated issues:

* `@[simp]` annotations on the `fromEval_*` lemmas should work.
* `cogito_triggers_modeC` combines `p.cogito_invariance` with `fromEval`'s
  definition via `rw` then `rfl`.

### Phase 2, Module G: `TLICA/IBoundary.lean` (new)

The boundary as a derived structure. Anticipated issues:

* `boundary` is defined as `p.positiveContents ∪ p.negativeContents`. The
  cogito is in the positive part, hence in the boundary; the architecture's
  "cogito interiority" notion uses a more refined boundary (see comments).
* `boundary_excludes_neutral` uses `rcases h1 with h | h` for the union;
  in each branch, `rw [h] at h2` then `cases h2`.

### Phase 2, Module H: `TLICA/ProjectMap.lean` (new)

The deterministic projection map. Anticipated issues:

* `Action` is an opaque structure with a `data : Unit` field; just enough
  to type-check. Applications will instantiate richer action spaces.
* `identity_action_natural` is an existential — exists *some* natural
  dynamics function. This is the weakest form of Axiom 5.3.1 and is
  trivially satisfiable (set `naturalDynamics := project Action.noAction`).

### Phase 2, Module I: `TLICA/PCE.lean` (new)

The composite definition. Anticipated issues:

* `noncomputable` is required for `PCE` because the underlying `Π.rank`
  is not computable.
* In the foundation-default deterministic variant, PCE evaluates to
  `Π.rank msi.contents` for every action; richer projection maps
  differentiate. This is intentional — the simpler variant gets us a
  type-correct PCE and downstream theorems; applications calibrate.
* `every_action_maximizes` is trivially true in this default.

## Error iteration protocol

Same as rounds 1, 2, 3. Apply category-1 (mathlib API drift), category-2
(typeclass), or category-3 (tactic divergence) fixes mechanically.
Escalate any category-4 (substantive logical) issue. Aim for at most
fifteen iteration cycles before escalation (round 3 took 11; round 4 has
more content but simpler proofs).

The structurally significant proofs to watch are:

1. `sameShellBound` — uses `linarith` with the `r_strict_anti` field
   directly. If linarith fails, add the `adjacent_gap_pos` lemma's
   conclusion as a hypothesis.
2. `shellStableDistanceVanishing_simple` — nested iSup over a subtype.
   Watch for `iSup_congr` vs `iSup_le` confusion.
3. `PseudoEMetricSpace` instance — should be near-trivial since the
   three round-3 lemmas already establish the obligations.

## Reporting protocol

Same five sections as previous rounds:

1. Build status (green / yellow / red).
2. Iteration log (one line per iteration; expected to be around 5–10).
3. Type-check of the new round-4 priority declarations (the eight named
   in step 3 above).
4. Modifications to source files (with old → new API name pairs).
5. Recommendations for the next round.

## What not to do

Do not modify the statements of any priority theorem from any round.
Do not fill in `shellStratifiedBound_TODO` — it is an intentional
placeholder for a future round. Do not change the mathlib pin or the
Lean toolchain pin. Do not introduce `sorry` to close failing proofs;
escalate as category-4 instead.

## Begin

When ready, begin with `elan show` to confirm the toolchain, then
`lake build`. Report the first-compile result before any iteration.
