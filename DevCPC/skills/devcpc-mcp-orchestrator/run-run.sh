#!/usr/bin/env bash
# devcpc run
# El medio (DSK/CDT) se selecciona automáticamente según CPC_MODEL:
#   CPC 464  → CDT
#   CPC 664/6128 → DSK
# Usage: run-run.sh <working_dir>
set -euo pipefail

DEVCPC="${DEVCPC_BIN:-$HOME/.DevCPC/bin/devcpc}"
WORKING_DIR="${1:?Error: working_dir requerido}"

cd "$WORKING_DIR"
"$DEVCPC" run
