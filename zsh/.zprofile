# --- Homebrew ---
# Set PATH, MANPATH, etc., for Homebrew.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# setup cargo
# this also adds cargo's bin directory to the PATH, so we don't need to do it separately
. "$HOME/.cargo/env"

# -- set neovim as default editor
export EDITOR=nvim
