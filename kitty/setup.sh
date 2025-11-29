#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
KITTY_CONFIG_DIR="$HOME/.config/kitty"

# Create kitty config directory if it doesn't exist
mkdir -p "$KITTY_CONFIG_DIR"

# Copy kitty configuration
if [ -f "$SCRIPT_DIR/kitty.conf" ]; then
  printf 'Installing kitty.conf...\n'
  cp "$SCRIPT_DIR/kitty.conf" "$KITTY_CONFIG_DIR/kitty.conf"
fi

# Copy kittens for vim-kitty-navigator
if [ -d "$SCRIPT_DIR/kittens" ]; then
  printf 'Installing kittens...\n'
  cp -r "$SCRIPT_DIR/kittens" "$KITTY_CONFIG_DIR/"
fi

printf '✓ kitty configured\n'
