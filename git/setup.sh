#!/usr/bin/env zsh
set -euo pipefail

git config --global user.name "Joao Seidel"
git config --global user.email "joaovseidel@gmail.com"

git config --global init.defaultbranch "main"
git config --global pull.rebase "true"
git config --global core.editor "vim"

printf '✓ git global config set\n'
