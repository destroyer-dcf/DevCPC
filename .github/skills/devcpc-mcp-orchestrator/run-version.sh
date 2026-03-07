#!/usr/bin/env bash
# devcpc version
# Usage: run-version.sh
set -euo pipefail

DEVCPC="${DEVCPC_BIN:-$HOME/.DevCPC/bin/devcpc}"
"$DEVCPC" version
