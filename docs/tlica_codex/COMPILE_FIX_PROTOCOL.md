# Compile Fix Protocol — TLICA Lean

Use this protocol whenever `lake build` fails.

## Category 1 — mathlib API drift

Symptoms:

- unknown constant where the theorem exists under a nearby name,
- changed argument order,
- import path moved,
- theorem namespace changed.

Action: repair mechanically. Do not change the mathematical statement.

Typical examples:

- `tsum_le_tsum` argument order drift.
- `tsum_pos` signature drift.
- import relocation around ordered fields, ENNReal, topology, uniform convergence.

## Category 2 — typeclass/import/scope issue

Symptoms:

- missing `DecidableEq`, `Classical`, `Nonempty`, `Fintype`, `LinearOrderedField`, etc.
- `simp` cannot find coercions because a scope is closed.
- ENNReal/NNReal notation unavailable.

Action:

- add local `by classical`, `open Classical`, or `open scoped ENNReal` as needed;
- add minimal imports;
- avoid globally strengthening assumptions unless the theorem genuinely needs them.

## Category 3 — tactic divergence

Symptoms:

- theorem statement is correct but tactic script fails;
- `simp`, `linarith`, `aesop`, `congr`, or extensionality no longer closes.

Action:

- replace brittle automation with explicit steps;
- use named helper lemmas;
- prefer short, robust proofs over compressed tactic golf.

## Category 4 — substantive logical issue

Symptoms:

- theorem is not derivable from the stated hypotheses;
- proof would require a new foundation axiom;
- the theorem conflates a definition with an empirical/application calibration;
- a claimed metric is only a pseudometric or extended pseudometric.

Action:

1. Do not silently weaken the claim.
2. Create an escalation note in `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`.
3. Choose one of:
   - add a named hypothesis if mathematically legitimate and source-grounded;
   - encode the claim as a structure/typeclass field if it is primitive;
   - move the theorem to a non-imported `TLICA/TODO/` file;
   - split the theorem into a proved weaker theorem plus an explicit open obligation.

## Prohibited fixes

- Replacing a theorem body with `by trivial` after weakening the statement to `True`.
- Adding `axiom` globally to bypass proof obligations.
- Deleting a hard theorem without documenting it.
- Presenting an application-calibrated claim as foundation-proven.
- Committing imported Lean files containing `sorry` or `admit`.
