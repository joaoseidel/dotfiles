#!/usr/bin/env zsh
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"
source "$REPO/00-env.sh"

# Helper: detect possible LinearMouse binary names
LM_BIN=""
for cand in linearmouse LinearMouse linear-mouse; do
  if command -v "$cand" >/dev/null 2>&1; then
    LM_BIN="$cand"
    break
  fi
done

if [ -n "$LM_BIN" ]; then
  # Deploy recommended config
  LM_DIR="$HOME/Library/Application Support/LinearMouse"
  mkdir -p "$LM_DIR"
  cat > "$LM_DIR/config.json" <<'JSON'
{
  "version": 1,
  "devices": [
    {
      "id": "*",
      "pointer": { "acceleration": 0, "sensitivity": 1.0 },
      "scroll": { "natural": false }
    }
  ]
}
JSON
  printf 'mouse: LinearMouse config written -> %s/config.json\n' "$LM_DIR"

  # Best-effort restart of LinearMouse agent/process (attempt multiple signals)
  pkill -f -x "LinearMouse" >/dev/null 2>&1 || true
  # Try launchctl kickstart for common label (best-effort)
  launchctl kickstart -k "gui/$UID/org.linearmouse.LinearMouse" 2>/dev/null || true
  printf 'mouse: LinearMouse config deployed; ensure Accessibility/Input Monitoring allowed for persistence\n'
  exit 0
fi
