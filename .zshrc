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
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf # Ctrl-R, Ctrl-T, Option-C
    docker
    docker-compose
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

# my .zshrc-hidden
ZSH_HIDDEN_PATH="$HOME/.zshrc-hidden"
if [ ! -d $ZSH_HIDDEN_PATH ]
then
    touch $ZSH_HIDDEN_PATH
fi
source $ZSH_HIDDEN_PATH

# k8s: shell autocompletion
if ! command -v kubectl &> /dev/null
then
    echo 'kubectl not found. Install it'
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/$(arch)/kubectl"
fi
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

# k8s: kube-ps1
source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh" 2> /dev/null
PS1='$(kube_ps1)'$PS1
if ! command -v kube_ps1 &> /dev/null
then
    echo 'kube_ps1 not found. Install it'
    brew install kube-ps1
fi

# Rust
if ! command -v rustc &> /dev/null
then
    echo 'rustc not found. Install it'
    curl https://sh.rustup.rs -sSf | sh -s -- --help
fi
source $HOME/.cargo/env

# golang
if ! command -v go &> /dev/null
then
    echo 'go not found. Install it'
    brew install go
fi
PATH="$HOME/go/bin:$PATH"

# pyenv
if ! command -v pyenv &> /dev/null
then
    echo 'pyenv not found. Install it'
    brew install pyenv
    echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# git-fuzzy
if [ ! -d "$HOME/git-fuzzy" ]
then
    git clone https://github.com/bigH/git-fuzzy.git
fi
export PATH="$HOME/git-fuzzy/bin:$PATH"

# java (adopt openjdk): https://github.com/AdoptOpenJDK/homebrew-openjdk
if ! command -v java &> /dev/null
then
    echo 'java not found. Install it'
    brew install temurin8
fi
JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"
PATH="$JAVA_HOME/bin:$PATH"

# IntelliJ IDEA
alias idea='open -na "IntelliJ IDEA.app"'

# bat : https://github.com/sharkdp/bat
if ! command -v bat &> /dev/null
then
    echo 'bat not found. Install it'
    brew install bat
fi

# node.js / npm
if ! command -v node &> /dev/null
then
    echo 'node not found. Install it'
    brew install node
fi

# delta : git diff pretty
if ! command -v delta &> /dev/null
then
    echo 'delta not found. Install it'
    brew install delta
fi

source /opt/homebrew/etc/profile.d/z.sh

# z : jump around, better cd
if ! command -v z &> /dev/null
then
    echo 'z not found. Install it'
    brew install z
fi


# jq : JSON processor
if ! command -v jq &> /dev/null
then
    echo 'jq not found. Install it'
    brew install jq
fi

# awscli
if ! command -v aws &> /dev/null
then
    echo 'awscli not found. Install it'
    brew install awscli
fi

# gh : GitHub CLI
if ! command -v gh &> /dev/null
then
    echo 'gh not found. Install it'
    brew install gh
fi

# rg
if ! command -v rg &> /dev/null
then
    echo 'rg not found. Install it'
    brew install ripgrep
fi

# fzf
if ! command -v fzf &> /dev/null
then
    echo 'fzf not found. Install it'
    brew install fzf

    # To install useful key bindings and fuzzy completion:
    $(brew --prefix)/opt/fzf/install
fi

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

