eval "$(/opt/homebrew/bin/brew shellenv)"
command -v pyenv && eval "$(pyenv init --path)"

# homebrew completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

