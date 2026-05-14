#!/usr/bin/env python3
from __future__ import annotations

import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

KEY_DOCS = [
    "AGENTS.md",
    "CODEX.md",
    "CLAIM_GUARDRAILS.md",
    "CODEX_SKILLS.md",
    "plans/ACTIVE_CODEX_PLAN.md",
    "MAPPING.md",
    "docs/tlica_codex/LEAN_VERIFICATION_REPORT.md",
    "docs/tlica_codex/lean_declaration_inventory.md",
    "docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md",
    "docs/tlica_rosetta/FEATURE_COMPLETENESS_MATRIX.md",
    "docs/tlica_rosetta/LEAN_IMPROVEMENT_BACKLOG.md",
]


def run(cmd: list[str]) -> str:
    try:
        return subprocess.check_output(cmd, cwd=ROOT, text=True, stderr=subprocess.STDOUT).strip()
    except Exception as exc:
        return f"unavailable: {exc}"


def detect_lean_dir() -> str:
    if (ROOT / "lakefile.lean").exists():
        return "."
    if (ROOT / "tlica-lean" / "lakefile.lean").exists():
        return "tlica-lean"
    return "not_found"


def main() -> int:
    ts = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    lean_files = []
    for candidate in (ROOT / "TLICA", ROOT / "tlica-lean" / "TLICA"):
        if candidate.exists():
            lean_files.extend(str(p.relative_to(ROOT)) for p in sorted(candidate.rglob("*.lean")))
    for top in (ROOT / "TLICA.lean", ROOT / "tlica-lean" / "TLICA.lean"):
        if top.exists():
            lean_files.append(str(top.relative_to(ROOT)))

    state = {
        "timestamp": ts,
        "branch": run(["git", "rev-parse", "--abbrev-ref", "HEAD"]),
        "head": run(["git", "rev-parse", "HEAD"]),
        "lean_dir": detect_lean_dir(),
        "lean_file_count": len(lean_files),
        "lean_files": lean_files,
        "key_docs": {doc: (ROOT / doc).exists() for doc in KEY_DOCS},
    }

    reports = ROOT / "reports"
    reports.mkdir(exist_ok=True)
    json_path = reports / f"{ts}_tlica_state.json"
    md_path = reports / f"{ts}_tlica_state.md"
    json_path.write_text(json.dumps(state, indent=2), encoding="utf-8")

    md = ["# TLICA State Summary", "", f"- Branch: `{state['branch']}`", f"- HEAD: `{state['head']}`", f"- Lean dir: `{state['lean_dir']}`", f"- Lean files: {state['lean_file_count']}", "", "## Key docs", ""]
    for doc, exists in state["key_docs"].items():
        md.append(f"- {'✅' if exists else '❌'} `{doc}`")
    md_path.write_text("\n".join(md) + "\n", encoding="utf-8")
    print(f"Wrote {json_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
