# Math-First Target Plan — TLICA Lean / Rosetta

## Phase 0 — Verify the seed

Target: make the current round-4 Lean project build locally.

Commands:

```bash
lake exe cache get
lake build
bash scripts/audit_lean.sh
```

Deliverable:

- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- updated `docs/tlica_codex/lean_declaration_inventory.md`

## Phase 1 — Close round-4 pending compile status

Priority declarations:

1. `sameShellBound`
2. `shellStableDistanceVanishing_simple`
3. `ProfileComparison.PseudoEMetric` instance
4. `MSI` facts
5. `PreservationRanking` facts
6. `PtCns` facts
7. `ModeOp` facts
8. `IBoundary` facts
9. `ProjectMap`
10. `PCE` facts

Rule: if a declaration fails due to Category 4 logical issues, do not weaken silently. Recast precisely and update the Rosetta ledger.

## Phase 2 — Strengthen the pure-math foundation

After the build is green, inspect the rigorous edition and working papers for mathematically direct claims not yet encoded.

Recommended targets:

1. Qualified triangle theorem for shared-domain distance under shared-subdomain coincidence.
2. General shell-stratified bound, possibly split into finite case and general case.
3. Additional order-theoretic properties of `PreservationRanking` if source-grounded.
4. Projection-map composition/identity lemmas.
5. Boundary partition lemmas induced by `ConsistencyEval`.

## Phase 3 — Expand Rosetta indexing

Build three synchronized indexes:

1. `ROSETTA_THEORY_TO_MATH_INDEX.md`
2. `ROSETTA_MATH_TO_THEORY_INDEX.md`
3. `ROSETTA_LEAN_DECLARATION_INDEX.md`

Each entry must point to the same Rosetta ID.

## Phase 4 — Application signatures

Only after foundation stability:

1. Temporal phenomenology: formal signatures for temporal profile evolution, retention/protention-style operators if source-grounded.
2. Agency: action-selection as projection/ranking/consistency constrained structure.
3. Free will: admissible branch-space under identity-preservation constraints.
4. Differentiated affect: profile-difference/appraisal/valence functionals.
5. Religiously charged experience: transformation/attractor signatures over identity-correlation state space.

Do not overclaim application theorems. Most application objects should begin as signatures and primitive calibration fields.

## Phase 5 — Branch push

When a coherent math-first increment is complete:

```bash
lake build
bash scripts/audit_lean.sh
python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md
git add .
git commit -m "Advance TLICA math-first Lean Rosetta"
git push -u origin codex/tlica-math-rosetta-v0
```
