eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"

# homebrew completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

