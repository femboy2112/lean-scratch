#!/usr/bin/env bash
# run.sh — Build the TLICA Lean formalization, type-check the priority
# theorems, and package logs + (optionally) source tree into a transportable
# zip artefact.
#
# Run from the repository root after install.sh has succeeded.
#
# Steps:
#   1. lake update            — refresh the dependency manifest
#                               (no-op if .lake/packages already populated).
#   2. lake exe cache get     — fetch prebuilt mathlib .olean files from the
#                               mathlib4 cache server. ON A NORMAL NETWORK this
#                               takes ~5–15 min. If the cache server is blocked
#                               (rare), mathlib will build from source (~30 min
#                               on a typical laptop).
#   3. lake build             — build the TLICA modules.
#   4. lean type-check        — confirm the priority-theorem signatures.
#   5. Package logs + sources into tlica-results-<timestamp>.zip.

set -euo pipefail

# Make sure elan is on PATH even if .profile wasn't sourced
export PATH="$HOME/.elan/bin:$PATH"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

if [ ! -d tlica-lean ]; then
    echo "ERROR: expected to find tlica-lean/ under $REPO_ROOT" >&2
    exit 1
fi

TS="$(date +%Y%m%d-%H%M%S)"
OUT_DIR="$REPO_ROOT/tlica-results-$TS"
mkdir -p "$OUT_DIR"
echo "Writing logs to $OUT_DIR"

cd tlica-lean

echo ""
echo "[1/4] lake update — refreshing dependency manifest…"
lake update 2>&1 | tee "$OUT_DIR/01-lake-update.log" || true

echo ""
echo "[2/4] lake exe cache get — fetching prebuilt mathlib oleans (5-15 min on normal network)…"
lake exe cache get 2>&1 | tee "$OUT_DIR/02-cache-get.log" || true

echo ""
echo "[3/4] lake build — compiling TLICA modules…"
set +e
lake build 2>&1 | tee "$OUT_DIR/03-lake-build.log"
BUILD_STATUS=${PIPESTATUS[0]}
set -e
echo "lake build exit status: $BUILD_STATUS" >> "$OUT_DIR/03-lake-build.log"

echo ""
echo "[4/4] Type-checking priority theorems…"
CHECK_FILE="$(mktemp /tmp/tlica-check-XXXXXX.lean)"
cat > "$CHECK_FILE" <<'EOF'
import TLICA

-- Rounds 1 + 2 priority theorems
#check @TLICA.IntegrationGraph.strict_rho_bound
#check @TLICA.PhiCoordinate.phi_tier3_lt_phiCogito
#check @TLICA.ModeAggregation.mode_aggregation_lt_one
#check @TLICA.Dynamics.mode_aggregation_uniform_convergent
#check @TLICA.NonReducibility.formal_non_reducibility

-- Round 3 new declarations
#check @TLICA.Profile.ScalarProfile.abs_sub_zeroExtend_le_one
#check @TLICA.ProfileComparison.Pointwise.dInfUnion_self
#check @TLICA.ProfileComparison.Pointwise.dInfUnion_triangle
#check @TLICA.ProfileComparison.Pointwise.dInfShared_top_iff

-- Union-form shell-bound corollaries
#check @TLICA.ProfileComparison.ShellRefinement.dInfUnion_le_of_pointwise
#check @TLICA.ProfileComparison.ShellRefinement.dInfUnion_le_of_pointwise_union
#check @TLICA.ProfileComparison.ShellRefinement.dInfUnion_le_shellEndpointBound_zeroExtend
#check @TLICA.ProfileComparison.ShellRefinement.dInfUnion_le_threeWayMax_shellEndpointBound
#check @TLICA.ProfileComparison.ShellRefinement.dInfUnion_le_of_pointwise_shellEndpointBound
EOF

LP=".lake/packages/batteries/.lake/build/lib"
LP="$LP:.lake/packages/Qq/.lake/build/lib"
LP="$LP:.lake/packages/aesop/.lake/build/lib"
LP="$LP:.lake/packages/proofwidgets/.lake/build/lib"
LP="$LP:.lake/packages/Cli/.lake/build/lib"
LP="$LP:.lake/packages/importGraph/.lake/build/lib"
LP="$LP:.lake/packages/mathlib/.lake/build/lib"
LP="$LP:.lake/build/lib"

if [ "$BUILD_STATUS" -eq 0 ]; then
    LEAN_PATH="$LP" lean "$CHECK_FILE" 2>&1 \
        | tee "$OUT_DIR/04-type-check.log"
else
    echo "Skipping type-check because lake build failed." \
        | tee "$OUT_DIR/04-type-check.log"
fi
rm -f "$CHECK_FILE"

# Copy sources sans build artefacts so the report tarball is small.
echo ""
echo "Packaging sources + logs…"
mkdir -p "$OUT_DIR/sources"
# rsync is convenient but not universally installed; cp + find is fine here.
( cd "$REPO_ROOT" && \
  find tlica-lean \
       -path 'tlica-lean/.lake' -prune -o \
       -path 'tlica-lean/.git'  -prune -o \
       -type f -print0 \
  | xargs -0 -I{} cp --parents {} "$OUT_DIR/sources/" )

cd "$REPO_ROOT"
ZIP_NAME="tlica-results-$TS.zip"
( cd "$REPO_ROOT" && zip -qr "$ZIP_NAME" "tlica-results-$TS" )

echo ""
echo "──────────────────────────────────────────"
echo "Build status:          $BUILD_STATUS  (0 = success)"
echo "Results directory:     $OUT_DIR"
echo "Results zip:           $REPO_ROOT/$ZIP_NAME"
echo "──────────────────────────────────────────"
exit "$BUILD_STATUS"
