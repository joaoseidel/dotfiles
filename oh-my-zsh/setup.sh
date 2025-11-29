#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install oh-my-zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  printf 'Installing oh-my-zsh...\n'
  RUNZSH=yes KEEP_ZSHRC=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Setup zshrc from template
if [ -f "$SCRIPT_DIR/zshrc.zsh-template" ]; then
  printf 'Setting up .zshrc from template...\n'
  cp "$SCRIPT_DIR/zshrc.zsh-template" "$HOME/.zshrc"
fi

printf '✓ oh-my-zsh ready\n'
