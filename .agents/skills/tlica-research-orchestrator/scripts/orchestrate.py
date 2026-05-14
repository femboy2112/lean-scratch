#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import json
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parents[4]


def main() -> int:
    active = ROOT / "plans" / "ACTIVE_CODEX_PLAN.md"
    ts = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    reports = ROOT / "reports"
    reports.mkdir(exist_ok=True)
    payload = {
        "timestamp": ts,
        "active_plan_exists": active.exists(),
        "active_plan": active.read_text(encoding="utf-8") if active.exists() else "",
    }
    (reports / f"{ts}_tlica_orchestration.json").write_text(json.dumps(payload, indent=2), encoding="utf-8")
    (reports / f"{ts}_tlica_orchestration.md").write_text("# TLICA Orchestration\n\nRead active plan and mission packet.\n", encoding="utf-8")
    print("orchestration scaffold complete")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
