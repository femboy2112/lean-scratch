# TLICA Lean — local build harness

Two scripts to drive the build on a Linux Mint / Ubuntu laptop, where
the mathlib4 cache server is reachable and `lake exe cache get` actually
works (it doesn't in the sandbox the round-1/2/3 iterations ran in).

## One-time setup

```bash
./install.sh
```

This installs:
- the apt packages Lean needs (`curl`, `git`, `zstd`, `build-essential`, …),
- elan (the Lean version manager) via the official installer,
- the `leanprover/lean4:v4.11.0` toolchain pinned by the project.

Then open a new shell, or `source ~/.profile`, so `lean`/`lake` are on PATH.

## Build + verify

```bash
./run.sh
```

This:

1. Runs `lake update` to refresh `.lake/packages/` (mathlib, batteries, …).
2. Runs `lake exe cache get` to pull mathlib's prebuilt `.olean` cache
   (~5–15 min on a normal network).
3. Runs `lake build` over the TLICA modules.
4. Type-checks the priority theorems from rounds 1, 2, and 3.
5. Bundles the logs and a clean copy of the source tree into
   `tlica-results-<timestamp>.zip` at the repo root.

The build either ends green (exit 0) or red, with the per-step logs
captured in `tlica-results-<timestamp>/` for diagnosis.

## Project layout

```
.
├── install.sh                  ← system-deps + Lean install
├── run.sh                      ← build + verify + package
├── tlica-lean/                 ← the Lean project
│   ├── lakefile.lean
│   ├── lean-toolchain          (pins leanprover/lean4:v4.11.0)
│   ├── TLICA.lean              (top-level import aggregator)
│   └── TLICA/
│       ├── Basic.lean
│       ├── IntegrationGraph.lean
│       ├── PhiCoordinate.lean
│       ├── ModeAggregation.lean
│       ├── Dynamics.lean
│       ├── NonReducibility.lean
│       ├── Profile.lean
│       └── ProfileComparison/
│           ├── Pointwise.lean
│           └── ShellRefinement.lean
└── README.md
```

The Lean project's own `tlica-lean/README.md` documents the
formalization contents and the priority-theorem mapping.
