#!/usr/bin/env python3
from __future__ import annotations

import json
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def detect_lean_dir() -> Path:
    if (ROOT / "lakefile.lean").exists():
        return ROOT
    if (ROOT / "tlica-lean" / "lakefile.lean").exists():
        return ROOT / "tlica-lean"
    raise SystemExit("ERROR: no lakefile.lean found at root or tlica-lean/")


def run(cmd: list[str], cwd: Path) -> dict:
    proc = subprocess.run(cmd, cwd=cwd, text=True, capture_output=True)
    return {
        "cmd": cmd,
        "cwd": str(cwd.relative_to(ROOT) if cwd != ROOT else Path(".")),
        "returncode": proc.returncode,
        "stdout": proc.stdout,
        "stderr": proc.stderr,
    }


def main() -> int:
    lean_dir = detect_lean_dir()
    ts = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    reports = ROOT / "reports"
    reports.mkdir(exist_ok=True)

    steps = []
    for cmd in (["lake", "exe", "cache", "get"], ["lake", "build"]):
        result = run(list(cmd), lean_dir)
        steps.append(result)
        if result["returncode"] != 0:
            break

    out = {
        "timestamp": ts,
        "lean_dir": str(lean_dir.relative_to(ROOT) if lean_dir != ROOT else Path(".")),
        "steps": steps,
    }
    path = reports / f"{ts}_lean_checks.json"
    path.write_text(json.dumps(out, indent=2), encoding="utf-8")

    md = reports / f"{ts}_lean_checks.md"
    md.write_text(
        "# Lean Check Report\n\n"
        f"- Lean dir: `{out['lean_dir']}`\n"
        + "\n".join(
            f"- `{' '.join(step['cmd'])}`: exit {step['returncode']}" for step in steps
        )
        + "\n",
        encoding="utf-8",
    )

    print(f"Wrote {path}")
    return 0 if all(step["returncode"] == 0 for step in steps) else 1


if __name__ == "__main__":
    raise SystemExit(main())
