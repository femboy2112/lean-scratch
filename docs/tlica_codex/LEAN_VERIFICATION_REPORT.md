# Lean Verification Report

## 1. Branch scope

- Base branch: `codex/tlica-profile-shell-bound-corollary-v0`
- Source Claude branch: `claude/test-lean-build-5zO1q`
- Current branch: `codex/tlica-claude-union-shell-sync-v0`
- Integration method: `git merge --no-ff origin/claude/test-lean-build-5zO1q`

This branch synchronizes Claude's union-domain shell-bound theorem work into the
normalized Codex/Rosetta control layer. It preserves the existing scalar
seven-shell theorem and shared-domain `dInfShared` corollaries, and adds the
union-domain `dInfUnion` theorem family with explicit zero-extension and
outer-shell absorption hypotheses.

No RCX formalization, named affect taxonomy, stochastic projection,
phenomenological duration, or contestable-boundary Lean theory was added.

## 2. Inherited branch verification

Commands run before branching:

- `git fetch --all`: succeeded.
- `git checkout codex/tlica-profile-shell-bound-corollary-v0`: already on the branch.
- `git pull`: already up to date.
- Working tree before merge: clean.

## 3. Merge and iteration log

- Iteration 0: merged `origin/claude/test-lean-build-5zO1q` with no file
  conflicts.
- Iteration 1: ran `lake exe cache get`; succeeded.
- Iteration 2: ran `lake build`; succeeded with existing warning-only lints.
- Iteration 3: ran `bash scripts/audit_lean.sh`; succeeded.
- Iteration 4: regenerated `docs/tlica_codex/lean_declaration_inventory.md`.
- Iteration 5: added low-risk `interiorShellIndexDistance` self/symmetry helper
  theorems and updated the Rosetta/control documentation.

No intermediate Lean build failure occurred after the merge.

## 4. Lean declarations added or integrated

Union-domain shell-bound family:

- `dInfUnion_le_of_pointwise`
- `dInfUnion_le_of_pointwise_union`
- `dInfUnion_le_shellEndpointBound_zeroExtend`
- `dInfUnion_le_threeWayMax_shellEndpointBound`
- `dInfUnion_le_of_pointwise_shellEndpointBound`

Interior shell-distance helper facts:

- `interiorShellIndexDistance_self`
- `interiorShellIndexDistance_symm`

Profile theorem status:

- Scalar seven-shell theorem: machine verified as `fullShellStratifiedBound`.
- Shared-domain `dInfShared` shell bounds: machine verified.
- Union-domain `dInfUnion` shell bounds: machine verified.
- Three-way max shell theorem: machine verified; preferred source-shape theorem
  for own-domain shell assignments.
- Zero-extension shell theorem: machine verified; preferred direct union API.

The new theorem family closes the union-domain shell-bound target identified in
the previous branch. The theorem package uses explicit zero-extension shell
assignments and treats absent profile values as outer-shell zero values.

## 5. Files changed

Lean source:

- `TLICA/ProfileComparison/ShellRefinement.lean`

Documentation and inventory:

- `MAPPING.md`
- `docs/tlica_codex/LEAN_VERIFICATION_REPORT.md`
- `docs/tlica_codex/lean_declaration_inventory.md`
- `docs/tlica_rosetta/SHELL_BOUNDARY_CONVENTION_AUDIT.md`
- `docs/tlica_rosetta/NEXT_LEAN_FRONTIER.md`
- `docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md`
- `docs/tlica_rosetta/ROSETTA_DECLARATION_COVERAGE.md`
- `docs/tlica_rosetta/ROSETTA_COVERAGE_AUDIT.md`
- `docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md`
- `docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md`

Provenance:

- `tlica-results-20260513-1654/`
- `tlica-results-20260513-1734/`

The Claude result folders were kept as provenance because they record cloud
Lean build success for the imported theorem family.

## 6. Verification status

- `elan show`: Lean `v4.11.0`, pinned by `lean-toolchain`.
- `lake exe cache get`: succeeded.
- `lake build`: succeeded with existing warning-only lints.
- `bash scripts/audit_lean.sh`: succeeded.
- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`: succeeded.

Audit target:

- Zero `sorry` in imported Lean files.
- Zero `admit` in imported Lean files.
- Zero global `axiom` declarations in imported Lean files.

## 7. Canonical `main` establishment

- `origin/main` status before this task: no remote `main` ref was present.
- Local `main` status before this task: no local `main` branch was present.
- Action taken: created `main` directly from the verified
  `codex/tlica-claude-union-shell-sync-v0` checkpoint.
- Obsolete one-shot prompt/orchestration files removed from `main`:
  - `CLAUDE_CODE_PROMPT.md`
  - `CLAUDE_CODE_PROMPT_ROUND2.md`
  - `CLAUDE_CODE_PROMPT_ROUND3.md`
  - `CLAUDE_CODE_PROMPT_ROUND4.md`
  - `ORCHESTRATION_GO.md`
  - `CODEX_GO_NEXT.md`
  - `tlica-lean/CLAUDE_CODE_PROMPT.md`
  - `tlica-lean/CLAUDE_CODE_PROMPT_ROUND2.md`
  - `tlica-lean/CLAUDE_CODE_PROMPT_ROUND3.md`
- Durable Codex/Rosetta prompt documentation under `docs/tlica_codex/` was
  kept as project documentation.
- Claude result-log copies under `tlica-results-*` were kept as provenance.
- `lake build`: succeeded with existing warning-only lints.
- `bash scripts/audit_lean.sh`: succeeded.
- `python3 scripts/extract_lean_decls.py > docs/tlica_codex/lean_declaration_inventory.md`:
  succeeded; no declaration inventory diff was produced by prompt removal.
- Audit target: zero imported `sorry`, zero imported `admit`, and zero global
  `axiom` declarations.

## 8. Remaining exclusions and next branch

Remaining exclusions:

- No RCX formalization.
- No named affect taxonomy.
- No stochastic projection.
- No phenomenological duration.
- Contestable boundary remains source-ambiguous and not Lean-ready.

Recommended next branch:

`codex/tlica-direct-projected-pce-api-v0`

Purpose: migrate newer modules away from compatibility names toward the primary
`ProjectMap α Act` / `ProjectedPCE` API where this is proof-stable.
