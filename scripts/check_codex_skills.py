#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]

REQUIRED_FILES = [
    "AGENTS.md",
    "CODEX.md",
    "CODEX_SKILLS.md",
    "CLAIM_GUARDRAILS.md",
    "REVIEW_RULES.md",
    "CODEX_TASKS.md",
    "plans/ACTIVE_CODEX_PLAN.md",
    ".codex/config.toml",
]

REQUIRED_SKILLS = [
    "tlica-research-orchestrator",
    "tlica-lean-build-doctor",
    "tlica-proof-boundary-auditor",
    "tlica-formalization-mapper",
    "tlica-profile-comparison-lab",
]

REQUIRED_AGENTS = [
    "lean_proof_engineer.toml",
    "mathlib_api_cartographer.toml",
    "proof_boundary_auditor.toml",
    "formalization_mapper.toml",
    "implementation_engineer.toml",
    "tlica_theory_analyst.toml",
]


def fail(msg: str) -> None:
    print(f"ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def main() -> None:
    missing = [p for p in REQUIRED_FILES if not (ROOT / p).exists()]
    if missing:
        fail("missing required files: " + ", ".join(missing))

    for skill in REQUIRED_SKILLS:
        skill_dir = ROOT / ".agents" / "skills" / skill
        if not skill_dir.is_dir():
            fail(f"missing skill directory: {skill_dir}")
        if not (skill_dir / "SKILL.md").exists():
            fail(f"missing SKILL.md for {skill}")

    for agent in REQUIRED_AGENTS:
        path = ROOT / ".codex" / "agents" / agent
        if not path.exists():
            fail(f"missing agent config: {path}")

    print("Codex scaffold OK")


if __name__ == "__main__":
    main()
