# --- Homebrew ---
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Download Znap, if it's not there yet.
[[ -r ~/Development/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Development/znap
source ~/Development/znap/znap.zsh  # Start Znap

# --- asdf ---
. "$(brew --prefix asdf)/libexec/asdf.sh"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)


# --- Starship prompt ---
znap eval starship 'starship init zsh'

# Emacs keybindings
bindkey -e
# Use the up and down keys to navigate the history
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Enable persistent history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt sharehistory
# prevents commands prefixed with a space from being saved into history file
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# Configure the push directory stack (most people don't need this)
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# allows case-insensitive matching for completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# shows colors for completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- direnv
eval "$(direnv hook zsh)"

# --- golang
. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh

# --- add cargo (rust) to path
export PATH="$HOME/.cargo/bin:$PATH"
# --- set bat theme via BAT_THEME env var
export BAT_THEME="Sublime Snazzy"

# cd aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# List directory contents
alias ls='ls -G'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# Defer loading of common plugins until after the prompt
znap prompt
() {
    local -a plugins=(
        git  # <-- Make sure 'git' is in this list
    )

    znap source ohmyzsh/ohmyzsh lib/git.zsh
    # Source the specified plugins
    znap source ohmyzsh/ohmyzsh plugins/$^plugins
}

# --- Plugins (keep syntax-highlighting last) ---
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting

# Initialize completion
autoload -Uz compinit && compinit
