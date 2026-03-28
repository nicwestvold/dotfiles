# --- Homebrew ---
# Set PATH, MANPATH, etc., for Homebrew.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# setup cargo
# this also adds cargo's bin directory to the PATH, so we don't need to do it separately
. "$HOME/.cargo/env"

export PATH="/opt/prince/bin:$PATH"
# --- set bat theme via BAT_THEME env var
# --- Theme Options ---
# export BAT_THEME="Catppuccin Macchiato"   # requires: https://github.com/catppuccin/bat
# export BAT_THEME="tokyonight_night"       # no official port; use Sublime tmTheme from tokyonight extras
# export BAT_THEME="kanagawa"               # requires: kanagawa.tmTheme from kanagawa.nvim extras/
# Doom One: no official bat port available
export BAT_THEME="Sublime Snazzy"
# -- set neovim as default editor
export EDITOR=nvim
