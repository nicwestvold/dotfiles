# setup cargo
. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

# Turn on ZSH autocomplete
# https://unix.stackexchange.com/a/477909
autoload -Uz compinit && compinit

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/opt/prince/bin:$PATH"

# Setup asdf
# https://hackercodex.com/guide/python-development-environment-on-mac-osx/
. $(brew --prefix asdf)/libexec/asdf.sh
# asdf reshim python
# asdf reshim nodejs

# https://github.com/asdf-vm/asdf/issues/692#issuecomment-642748733
autoload -U +X bashcompinit && bashcompinit

# set up bash completions
# https://blog.natterstefan.me/how-to-use-multiple-node-version-with-asdf
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
