#!/usr/bin/env bash
set -euo pipefail

fail=0

echo "== TLICA Lean audit =="

if grep -R --line-number --include='*.lean' -E '\b(sorry|admit)\b' TLICA TLICA.lean 2>/dev/null; then
  echo "ERROR: imported Lean files contain sorry/admit."
  fail=1
else
  echo "OK: no sorry/admit found in imported Lean files."
fi

if grep -R --line-number --include='*.lean' -E '^\s*axiom\b' TLICA TLICA.lean 2>/dev/null; then
  echo "WARNING: global axiom declarations found. Verify these are deliberate and mapped."
else
  echo "OK: no global axiom declarations found in imported Lean files."
fi

if [ -f MAPPING.md ]; then
  echo "OK: MAPPING.md exists."
else
  echo "ERROR: MAPPING.md missing."
  fail=1
fi

if [ -f docs/tlica_rosetta/ROSETTA_MATH_FIRST_LEDGER.md ]; then
  echo "OK: Rosetta math-first ledger exists."
else
  echo "ERROR: Rosetta math-first ledger missing."
  fail=1
fi

exit "$fail"
