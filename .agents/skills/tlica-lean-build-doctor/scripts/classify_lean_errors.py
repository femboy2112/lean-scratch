#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path

CATEGORIES = {
    "api_drift": [r"unknown identifier", r"unknown constant", r"invalid import", r"module .* not found"],
    "typeclass_resolution": [r"failed to synthesize", r"typeclass", r"Decidable"],
    "tactic_divergence": [r"tactic .* failed", r"unsolved goals", r"linarith failed", r"omega"],
    "substantive_issue": [r"type mismatch", r"application type mismatch", r"invalid field"],
    "placeholder_hygiene": [r"sorry", r"admit", r": True", r"by trivial"],
}


def classify(text: str) -> dict[str, int]:
    return {name: sum(len(re.findall(p, text, flags=re.I)) for p in pats) for name, pats in CATEGORIES.items()}


def main() -> int:
    if len(sys.argv) < 2:
        print("usage: classify_lean_errors.py <log>")
        return 2
    text = Path(sys.argv[1]).read_text(encoding="utf-8", errors="replace")
    for k, v in classify(text).items():
        print(f"{k}: {v}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
