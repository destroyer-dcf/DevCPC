#!/usr/bin/env bash
# devcpc help [command]
# Usage: run-help.sh [command]
set -euo pipefail

DEVCPC="${DEVCPC_BIN:-$HOME/.DevCPC/bin/devcpc}"
COMMAND="${1:-}"

if [[ -n "$COMMAND" ]]; then
  "$DEVCPC" help "$COMMAND"
else
  "$DEVCPC" help
fi
