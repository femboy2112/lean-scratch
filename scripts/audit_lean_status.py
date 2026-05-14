#!/usr/bin/env python3
from __future__ import annotations

import json
import re
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LEAN_DIRS = [ROOT / "TLICA", ROOT / "tlica-lean" / "TLICA"]
PATTERNS = {
    "sorry": re.compile(r"\bsorry\b"),
    "admit": re.compile(r"\badmit\b"),
    "global_axiom": re.compile(r"^\s*axiom\b", re.M),
    "true_placeholder": re.compile(r"\b(theorem|lemma|def)\s+[^\n:]+:\s*True\b"),
    "deferred_marker": re.compile(r"\b\w+_deferred\s*:\s*Prop\s*:=\s*True\b"),
}


def lean_files() -> list[Path]:
    files: list[Path] = []
    for d in LEAN_DIRS:
        if d.exists():
            files.extend(sorted(d.rglob("*.lean")))
    if (ROOT / "TLICA.lean").exists():
        files.append(ROOT / "TLICA.lean")
    if (ROOT / "tlica-lean" / "TLICA.lean").exists():
        files.append(ROOT / "tlica-lean" / "TLICA.lean")
    return files


def main() -> int:
    ts = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    results: dict[str, list[dict[str, str | int]]] = {k: [] for k in PATTERNS}
    for path in lean_files():
        text = path.read_text(encoding="utf-8", errors="replace")
        rel = str(path.relative_to(ROOT))
        for name, pat in PATTERNS.items():
            for m in pat.finditer(text):
                line = text.count("\n", 0, m.start()) + 1
                results[name].append({"file": rel, "line": line, "match": m.group(0)[:200]})

    reports = ROOT / "reports"
    reports.mkdir(exist_ok=True)
    json_path = reports / f"{ts}_lean_status_audit.json"
    md_path = reports / f"{ts}_lean_status_audit.md"
    json_path.write_text(json.dumps(results, indent=2), encoding="utf-8")

    lines = ["# Lean Status Audit", ""]
    for name, hits in results.items():
        lines.append(f"## {name} — {len(hits)}")
        for hit in hits[:50]:
            lines.append(f"- `{hit['file']}:{hit['line']}` — `{hit['match']}`")
        if len(hits) > 50:
            lines.append(f"- ... {len(hits) - 50} more")
        lines.append("")
    md_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {json_path}")

    fatal = len(results["sorry"]) + len(results["admit"]) + len(results["global_axiom"])
    return 1 if fatal else 0


if __name__ == "__main__":
    raise SystemExit(main())
