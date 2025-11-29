#!/usr/bin/env zsh
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"
source "$REPO/00-env.sh"

# --- Appearance: graphite accent + neutral highlight ---
defaults write -g AppleAccentColor -int -1
defaults write -g AppleHighlightColor "0.847059 0.847059 0.862745"

# --- Keyboard ---
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
defaults write -g ApplePressAndHoldEnabled -bool false

# --- Trackpad/Mouse basic (no-op if device absent) ---
# Tap to click for trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1 2>/dev/null || true
# Trackpad speed (float)
defaults write -g com.apple.trackpad.scaling -float 2.5 2>/dev/null || true

# --- Dock ---
# defaults write com.apple.dock autohide -bool true
# defaults write com.apple.dock autohide-delay -float 0
# defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock tilesize -int 48

# --- Finder ---
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# --- Screenshots ---
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture location "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture type "png"

# --- Apply minimal reloads ---
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

printf '✓ macOS defaults applied\n'
