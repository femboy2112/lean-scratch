#!/usr/bin/env python3
"""Validate the project-scoped Codex control layer."""
from __future__ import annotations

import json
import re
import sys
import tomllib
from pathlib import Path

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

FRONTMATTER = re.compile(r"^---\n(.*?)\n---\n", re.DOTALL)
SUPPORTED_AGENT_KEYS = {
    "name",
    "developer_instructions",
    "model_reasoning_effort",
    "model_verbosity",
    "approval_policy",
    "sandbox_mode",
}


def parse_frontmatter(text: str) -> dict[str, str]:
    match = FRONTMATTER.match(text)
    if not match:
        return {}
    data: dict[str, str] = {}
    for line in match.group(1).splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip().strip('"').strip("'")
    return data


def fail(msg: str) -> None:
    print(f"ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def append_finding(findings: list[dict[str, str]], severity: str, path: str, message: str) -> None:
    findings.append({"severity": severity, "path": path, "message": message})


def validate_skill(skill: str, findings: list[dict[str, str]]) -> None:
    skill_dir = ROOT / ".agents" / "skills" / skill
    rel_dir = skill_dir.relative_to(ROOT)
    if not skill_dir.is_dir():
        append_finding(findings, "BLOCKER", str(rel_dir), "missing skill directory")
        return
    skill_md = skill_dir / "SKILL.md"
    rel_md = str(skill_md.relative_to(ROOT))
    if not skill_md.exists():
        append_finding(findings, "BLOCKER", rel_md, "missing SKILL.md")
        return
    meta = parse_frontmatter(skill_md.read_text(encoding="utf-8"))
    if meta.get("name") != skill:
        append_finding(findings, "BLOCKER", rel_md, "frontmatter name must match skill directory")
    description = meta.get("description", "")
    if not description:
        append_finding(findings, "BLOCKER", rel_md, "missing description in YAML frontmatter")
    elif len(description) < 60:
        append_finding(findings, "WARNING", rel_md, "frontmatter description may be too short for discovery")


def validate_agent(agent: str, findings: list[dict[str, str]]) -> None:
    path = ROOT / ".codex" / "agents" / agent
    rel = str(path.relative_to(ROOT))
    if not path.exists():
        append_finding(findings, "BLOCKER", rel, "missing agent config")
        return
    try:
        data = tomllib.loads(path.read_text(encoding="utf-8"))
    except tomllib.TOMLDecodeError as exc:
        append_finding(findings, "BLOCKER", rel, f"invalid TOML: {exc}")
        return
    unsupported = sorted(set(data) - SUPPORTED_AGENT_KEYS)
    if unsupported:
        append_finding(
            findings,
            "BLOCKER",
            rel,
            "unsupported Codex agent keys: " + ", ".join(unsupported),
        )
    instructions = data.get("developer_instructions")
    if not isinstance(instructions, str) or not instructions.strip():
        append_finding(findings, "BLOCKER", rel, "missing non-empty developer_instructions")
    expected_name = path.stem
    if data.get("name") != expected_name:
        append_finding(findings, "BLOCKER", rel, f"name must be {expected_name!r}")


def main() -> None:
    findings: list[dict[str, str]] = []

    missing = [p for p in REQUIRED_FILES if not (ROOT / p).exists()]
    if missing:
        fail("missing required files: " + ", ".join(missing))

    for skill in REQUIRED_SKILLS:
        validate_skill(skill, findings)

    for agent in REQUIRED_AGENTS:
        validate_agent(agent, findings)

    if findings:
        print(json.dumps({"ok": False, "findings": findings}, indent=2), file=sys.stderr)
        if any(finding["severity"] == "BLOCKER" for finding in findings):
            sys.exit(1)

    print("Codex scaffold OK")


if __name__ == "__main__":
    main()
