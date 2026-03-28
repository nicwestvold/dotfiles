#!/usr/bin/env bash
# Shared mappings: each entry is "app|source_relative|target_absolute"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

MAPPINGS=(
  "zsh|zsh/.zshrc|$HOME/.zshrc"
  "zsh|zsh/.zprofile|$HOME/.zprofile"
  "tmux|tmux/.tmux.conf|$HOME/.tmux.conf"
  "starship|prompt/starship.toml|$HOME/.config/starship.toml"
  "bat|bat/config|$HOME/.config/bat/config"
  "ghostty|ghostty/config|$HOME/.config/ghostty/config"
)
