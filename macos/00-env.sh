#!/usr/bin/env zsh
set -euo pipefail

export MACOS_VER="$(sw_vers -productVersion 2>/dev/null || echo "0.0.0")"
export MACOS_MAJOR="$(echo "$MACOS_VER" | cut -d. -f1 | tr -d '[:alpha:]' || echo 0)"

is_at_least() {
  # is_at_least <major>
  [ "${MACOS_MAJOR:-0}" -ge "$1" ]
}
