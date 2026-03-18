# --- Homebrew ---
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Download Znap, if it's not there yet.
[[ -r ~/Development/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Development/znap
source ~/Development/znap/znap.zsh  # Start Znap

# mise
eval "$(mise activate zsh)"

eval "$(gwt shell-init)"

# --- Bare repo detection for Starship ---
function _check_bare_repo() {
   if [[ "$(git config --get core.bare 2>/dev/null)" == "true" ]]; then
     export STARSHIP_CONFIG="$HOME/.config/starship-bare.toml"
   else
     unset STARSHIP_CONFIG
   fi
}
chpwd_functions+=(_check_bare_repo)
_check_bare_repo

# --- Starship prompt ---
znap eval starship 'starship init zsh'

# Emacs keybindings
bindkey -e

# Move cursor to end of line after history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end  # Up arrow
bindkey "^[[B" history-beginning-search-forward-end    # Down arrow

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

# # --- golang (with asdf)
# . ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh

# --- add cargo (rust) to path
export PATH="$HOME/.cargo/bin:$PATH"
# --- set bat theme via BAT_THEME env var
export BAT_THEME="Sublime Snazzy"

# --- add ~/.local/bin to path for user-installed tools
export PATH="$HOME/.local/bin:$PATH"

# extensions - adding any new filenames inside of the brackets
for file in ~/.dotfiles/zsh/{exports,aliases,functions,custom}; do
  [[ -f "$file" ]] && source "$file"
done;

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

take() {
  mkdir -p "$1" && cd "$1"
}

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

# --- remove the `gwt*` aliases that ohmyzsh added above
unalias 'gwt'
unalias 'gwta'
unalias 'gwtls'
unalias 'gwtmv'
unalias 'gwtrm'

# --- Plugins (keep syntax-highlighting last) ---
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting

# Initialize completion
autoload -Uz compinit && compinit
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/nicwestvold/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
