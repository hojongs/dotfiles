# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME="random"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true" # it seems not working

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aws
    git
    gh
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-interactive-cd
    z
    docker
    docker-compose
    npm
    yarn
    tmux
    timer
    kubectl
    gradle-completion
    history
    brew
    fzf
    ubuntu
    debian
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ $OSTYPE =~ "^darwin" ]]
then
    # Mac OS
    ZSHRC_DIST="darwin"
else
    # WSL Ubuntu
    ZSHRC_DIST="linux"
fi

HOME_BIN="$HOME/bin"
ZSH_HOME_PATH="$HOME/.zshrc_home"
ZSH_HIDDEN_PATH="$HOME/.zshrc-hidden"

# home bin
export PATH="$HOME/bin:$PATH"

# my .zshrc-hidden
source $ZSH_HIDDEN_PATH

# kubectl
source <(kubectl completion zsh)
complete -F __start_kubectl k

# kube-ps1
# https://github.com/jonmosco/kube-ps1
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh" 2> /dev/null
    PS1='$(kube_ps1)'$PS1
else
    source $HOME/.zshrc_home/kube-ps1/kube-ps1.sh
fi

# Rust
source $HOME/.cargo/env

# golang
export PATH="$(go env GOPATH)/bin:$PATH"

# pyenv
# https://github.com/pyenv/pyenv
eval "$(pyenv init -)"

# pyenv-virtualenv
# https://github.com/pyenv/pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# git-fuzzy
# https://github.com/bigH/git-fuzzy
export PATH="$ZSH_HOME_PATH/git-fuzzy/bin:$PATH"
alias gzf='git fuzzy'
alias gzfb='git fuzzy branch'

# java (adopt openjdk)
# https://github.com/AdoptOpenJDK/homebrew-openjdk
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    # gradle depends on openjdk@11
    # export PATH="$(brew --prefix)/opt/openjdk@11/bin:$PATH"
    # export CPPFLAGS="-I$(brew --prefix)/opt/openjdk@11/include $CPPFLAGS"
    
    if [[ $(arch) = 'arm64' ]]
    then
        export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/azul-15.0.4/Contents/Home" # installed via intellij
    else
        export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home" # installed via brew
    fi
    export PATH="$JAVA_HOME/bin:$PATH"
fi

# z
# https://github.com/rupa/z
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    source $(brew --prefix)/etc/profile.d/z.sh
fi

# awscli
# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
# complete -C $(which aws_completer) aws

### ZNT's installer added snippet ###
fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
zle -N znt-history-widget
bindkey '^R' znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###

# pbkit: https://github.com/pbkit/pbkit
source <(pb completions zsh)
source <(pollapo completions zsh)

# some aliases
alias eixt="exit"
alias exi="exit"
alias ei="exit"
alias zshrc="vi ~/.zshrc"
alias vimrc="vi ~/.vimrc"
alias kc="kubectx"
alias kn="kubens"
alias kd="kubectl describe"
alias kg="kubectl get"
alias ga.="ga ."
alias gdc="gdca"
alias gdta="git describe --tags --abbrev=4"
alias gpot="git push origin && git push origin --tags"
alias k9s="LC_CTYPE=en_US.UTF-8 k9s"

# git-extra: https://github.com/tj/git-extras
. $(brew --prefix)/opt/git-extras/share/git-extras/git-extras-completion.zsh

