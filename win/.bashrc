alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias la='ls -la --color=auto'

alias ..='cd ..'

alias gco='git checkout'
alias gcb='gco -b'

alias gp='git push'
alias gpf='gp --force'

alias gc='git commit -v'
alias gca='gc --amend'

alias gd='git diff'
alias gdc='git diff --cached'

alias gst='git status'
alias glg='git log --stat'
alias glgga='git log --graph --decorate --all'
alias ga='git add'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
