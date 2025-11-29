#!/usr/bin/env zsh
set -euo pipefail

# Ensure asdf on PATH (if installed via brew)
if command -v asdf >/dev/null 2>&1; then
  ASDF_BIN="$(command -v asdf)"
else
  printf 'asdf: not installed; skipping asdf setup\n'
  exit 0
fi

# Plugins and installs

# Kotlin
asdf plugin-add kotlin || true
asdf install kotlin latest || true
asdf global kotlin latest || true

# Java
asdf plugin-add java https://github.com/halcyon/asdf-java.git || true
asdf install java latest:adoptopenjdk-24 || true
asdf install java latest:adoptopenjdk-25 || true
asdf global java latest:adoptopenjdk-25 || true

# Node.js
asdf plugin-add nodejs || true
asdf install nodejs latest || true
asdf global nodejs latest || true

# Bun
asdf plugin-add bun || true
asdf install bun latest || true
asdf global bun latest || true

# Python
asdf plugin-add python || true
asdf install python latest || true
asdf global python latest || true

# Update asdfrc flags
grep -q 'java_macos_integration_enable' ~/.asdfrc 2>/dev/null || echo "java_macos_integration_enable=yes" >> ~/.asdfrc
grep -q 'legacy_version_file' ~/.asdfrc 2>/dev/null || echo "legacy_version_file = yes" >> ~/.asdfrc

printf '✓ asdf setup attempted (check output for failures)\n'
