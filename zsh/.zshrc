# Download Znap, if it's not there yet.
[[ -r ~/Development/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Development/znap
source ~/Development/znap/znap.zsh  # Start Znap

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

# --- direnv
eval "$(direnv hook zsh)"

# --- OrbStack
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

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

# allows case-insensitive matching for completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# shows colors for completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Initialize completion
autoload -Uz compinit && compinit

# --- mise
eval "$(mise activate zsh)"
