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

# --- fzf Theme Options (uncomment one) ---
# Catppuccin Macchiato
# export FZF_DEFAULT_OPTS=" \
#   --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
#   --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
#   --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
#   --color=selected-bg:#494d64"
# Tokyo Night
# export FZF_DEFAULT_OPTS=" \
#   --color=bg+:#283457,bg:#16161e,spinner:#bb9af7,hl:#7aa2f7 \
#   --color=fg:#c0caf5,header:#7aa2f7,info:#7dcfff,pointer:#bb9af7 \
#   --color=marker:#9ece6a,fg+:#c0caf5,prompt:#7dcfff,hl+:#7aa2f7 \
#   --color=selected-bg:#364a82"
# Kanagawa Wave
# export FZF_DEFAULT_OPTS=" \
#   --color=bg+:#223249,bg:#1f1f28,spinner:#c8748f,hl:#7e9cd8 \
#   --color=fg:#dcd7ba,header:#7e9cd8,info:#6a9589,pointer:#c8748f \
#   --color=marker:#98bb6c,fg+:#dcd7ba,prompt:#6a9589,hl+:#7e9cd8 \
#   --color=selected-bg:#2d4f67"
# Doom One: no official fzf port available

# --- direnv
eval "$(direnv hook zsh)"

# --- OrbStack
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# extensions - adding any new filenames inside of the brackets
for file in ~/.config/zsh/{exports,aliases,functions,custom}; do
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

# allows case-insensitive matching for completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# shows colors for completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/nicwestvold/.docker/completions $fpath)

# Initialize completion
autoload -Uz compinit && compinit

# --- mise
eval "$(mise activate zsh)"

if command -v gwt &>/dev/null; then
  eval "$(gwt shell-init)"
else
  echo "gwt not installed - https://github.com/nicwestvold/gwt"
fi
