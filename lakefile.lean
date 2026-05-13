import Lake
open Lake DSL

package «tlica» where
  -- TLICA (Two-Layer Identity-Correlation Architecture) — Lean formalization.
  -- Encodes priority targets from the v0.3.1 rigorous edition of the formal apparatus.

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.11.0"

@[default_target]
lean_lib «TLICA» where
  -- Top-level library importing all encoded modules.
