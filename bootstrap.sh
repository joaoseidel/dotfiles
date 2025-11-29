#!/usr/bin/env zsh
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"

# Homebrew (install if missing)
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # ensure brew in path for non-interactive shells (Intel / Apple Silicon)
  if [ -d /opt/homebrew/bin ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -d /usr/local/bin ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Install packages from Brewfile
if [ -f "$REPO/Brewfile" ]; then
  brew bundle --file="$REPO/Brewfile"
fi

# macOS modules
"$REPO/macos/00-env.sh"
"$REPO/macos/defaults.sh"
"$REPO/macos/mouse.sh"

# other modules
"$REPO/git/setup.sh" || true
"$REPO/asdf/setup.sh" || true
"$REPO/kitty/setup.sh" || true
"$REPO/oh-my-zsh/setup.sh" || true

printf '✓ bootstrap complete\n'
