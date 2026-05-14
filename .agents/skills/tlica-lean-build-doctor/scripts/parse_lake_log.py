#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

if len(sys.argv) < 2:
    print("usage: parse_lake_log.py <log>")
    raise SystemExit(2)

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8", errors="replace")
print(f"log: {path}")
print(f"errors: {text.lower().count('error')}")
print(f"warnings: {text.lower().count('warning')}")
print("build_success:", "Build completed successfully" in text or "Built TLICA" in text)
