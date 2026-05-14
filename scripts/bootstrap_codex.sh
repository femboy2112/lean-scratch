#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ -f lakefile.lean ]]; then
  LEAN_DIR="."
elif [[ -f tlica-lean/lakefile.lean ]]; then
  LEAN_DIR="tlica-lean"
else
  echo "ERROR: no lakefile.lean found at root or tlica-lean/" >&2
  exit 2
fi

mkdir -p reports

echo "ROOT=$ROOT"
echo "LEAN_DIR=$LEAN_DIR"
echo "BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown)"

echo "Checking Codex scaffold..."
python3 scripts/check_codex_skills.py

echo "Bootstrap complete."
