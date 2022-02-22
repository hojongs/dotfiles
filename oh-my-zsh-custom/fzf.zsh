export FZF_DEFAULT_COMMAND='rg --files --glob "!.git/*" --glob "!Library/*"'
export FZF_CTRL_T_COMMAND='rg --files --glob "!.git/*" --glob "!Library/*"'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --follow --exclude ".git" --exclude "Library" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --follow --exclude ".git" --exclude "Library" . "$1"
}

