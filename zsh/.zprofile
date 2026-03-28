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
export BAT_THEME="Sublime Snazzy"
# -- set neovim as default editor
export EDITOR=nvim
