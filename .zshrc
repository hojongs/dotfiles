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
    gradle
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

# home bin
HOME_BIN="$HOME/bin"
if [[ ! -d $HOME_BIN ]]
then
    mkdir $HOME_BIN
fi
export PATH="$HOME/bin:$PATH"

# my .zshrc_home
ZSH_HOME_PATH="$HOME/.zshrc_home"
if [[ ! -d $ZSH_HOME_PATH ]]
then
    mkdir $ZSH_HOME_PATH
fi

# my .zshrc-hidden
ZSH_HIDDEN_PATH="$HOME/.zshrc-hidden"
if [[ ! -d $ZSH_HIDDEN_PATH ]]
then
    touch $ZSH_HIDDEN_PATH
fi
source $ZSH_HIDDEN_PATH

# gh : GitHub CLI
# https://github.com/cli/cli
if ! command -v gh &> /dev/null
then
    echo 'gh not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install gh
    else
        # https://github.com/cli/cli/blob/trunk/docs/install_linux.md
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
        sudo apt update
        sudo apt install gh
    fi
fi

# k8s: shell autocompletion
if ! command -v kubectl &> /dev/null
then
    echo 'kubectl not found. Install it'

    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/$(arch)/kubectl"
    else
        sudo apt install -y apt-transport-https ca-certificates curl
        sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
        echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
        sudo apt update
        sudo apt install -y kubectl
#         curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#         curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
#         echo "$(<kubectl.sha256) kubectl" | sha256sum --check
#         install -m 0755 kubectl $HOME/bin/kubectl
    fi
fi
source <(kubectl completion zsh)
complete -F __start_kubectl k

# k8s: kube-ps1
# https://github.com/jonmosco/kube-ps1
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh" 2> /dev/null
    PS1='$(kube_ps1)'$PS1
else
    source $HOME/.zshrc_home/kube-ps1/kube-ps1.sh
fi
if ! command -v kube_ps1 &> /dev/null
then
    echo 'kube_ps1 not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install kube-ps1
    else
        gh repo clone jonmosco/kube-ps1 $ZSH_HOME_PATH/kube-ps1
    fi
fi

# Rust
if ! command -v rustc &> /dev/null
then
    echo 'rustc not found. Install it'
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
source $HOME/.cargo/env

# golang
if ! command -v go &> /dev/null
then
    echo 'go not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install go
    else
        sudo apt install golang-go
    fi
fi
export PATH="$(go env GOPATH)/bin:$PATH"

# pyenv
# https://github.com/pyenv/pyenv
if ! command -v pyenv &> /dev/null
then
    echo 'pyenv not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install pyenv
        echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
    else
        gh repo clone pyenv/pyenv $HOME/.pyenv
        cd $HOME/.pyenv && src/configure && make -C src && cd -
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
        echo 'eval "$(pyenv init --path)"' >> ~/.profile
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
        echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
    fi
fi
eval "$(pyenv init -)"

# pyenv-virtualenv
# https://github.com/pyenv/pyenv-virtualenv
if [[ ! -d $(pyenv root)/plugins/pyenv-virtualenv ]]
then
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi
eval "$(pyenv virtualenv-init -)"

# git-fuzzy
# https://github.com/bigH/git-fuzzy
if [[ ! -d "$ZSH_HOME_PATH/git-fuzzy" ]]
then
    gh repo clone bigH/git-fuzzy $ZSH_HOME_PATH/git-fuzzy
fi
export PATH="$ZSH_HOME_PATH/git-fuzzy/bin:$PATH"
alias gzf='git fuzzy'
alias gzfb='git fuzzy branch'

# java (adopt openjdk)
# https://github.com/AdoptOpenJDK/homebrew-openjdk
if ! command -v java &> /dev/null
then
    echo 'java not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install temurin8
    else
        sudo apt install -y wget apt-transport-https gnupg
        wget https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public -O $HOME/public
        gpg --no-default-keyring --keyring $HOME/adoptopenjdk-keyring.gpg --import $HOME/public
        gpg --no-default-keyring --keyring $HOME/adoptopenjdk-keyring.gpg --export --output $HOME/adoptopenjdk-archive-keyring.gpg 
        rm $HOME/adoptopenjdk-keyring.gpg
        sudo mv $HOME/adoptopenjdk-archive-keyring.gpg /usr/share/keyrings 
        CODENAME=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d = -f 2)
        echo "deb [signed-by=/usr/share/keyrings/adoptopenjdk-archive-keyring.gpg] https://adoptopenjdk.jfrog.io/adoptopenjdk/deb $CODENAME main" | sudo tee /etc/apt/sources.list.d/adoptopenjdk.list
        sudo apt update
        sudo apt install adoptopenjdk-8-hotspot
    fi
fi
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"
    export PATH="$JAVA_HOME/bin:$PATH"

    # gradle depends on openjdk@11
    export PATH="$(brew --prefix)/opt/openjdk@11/bin:$PATH"
    export CPPFLAGS="-I$(brew --prefix)/opt/openjdk@11/include $CPPFLAGS"
fi

# IntelliJ IDEA
if ! command -v idea &> /dev/null
then
    alias idea='open -na "IntelliJ IDEA.app"'
fi

# bat
# https://github.com/sharkdp/bat
if ! command -v bat &> /dev/null
then
    echo 'bat not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install bat
    else
        sudo apt install bat
        ln -s /usr/bin/batcat $HOME/bin/bat
    fi
fi

# node.js / npm
if ! command -v node &> /dev/null
then
    echo 'node not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install node
    fi
fi

# delta : git diff pretty
# https://github.com/dandavison/delta#installation
if ! command -v delta &> /dev/null
then
    echo 'delta not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install git-delta
    else
        wget https://github.com/dandavison/delta/releases/download/0.8.3/git-delta_0.8.3_amd64.deb -O $HOME/git-delta_0.8.3_amd64.deb
        sudo dpkg -i $HOME/git-delta_0.8.3_amd64.deb
    fi
fi

# z
# https://github.com/rupa/z
if ! command -v z &> /dev/null
then
    echo 'z not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install z
    fi
fi
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    source $(brew --prefix)/etc/profile.d/z.sh
fi

# jq : JSON processor
# https://github.com/stedolan/jq
if ! command -v jq &> /dev/null
then
    echo 'jq not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install jq
    fi
fi

# fzf
# https://github.com/junegunn/fzf
if ! command -v fzf &> /dev/null
then
    echo 'fzf not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install fzf
    fi
fi

# awscli
if ! command -v aws &> /dev/null
then
    echo 'awscli not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install awscli
    fi
fi
# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
# complete -C $(which aws_completer) aws

# rg : ripgrep
# https://github.com/BurntSushi/ripgrep#installation
if ! command -v rg &> /dev/null
then
    echo 'rg not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install ripgrep
    fi
fi

# zsh-autosuggestions
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-autosuggestions
if [[ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-syntax-highlighting
if [[ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# zsh-navigation-tools : Ctrl-R
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-navigation-tools
if [[ ! -d "$HOME/.config/znt/zsh-navigation-tools/" ]]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zsh-navigation-tools/master/doc/install.sh)"
fi
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

# pbkit
if ! command -v pb &> /dev/null
then
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew tap riiid/riiid
        brew install pbkit
    else
    fi
fi
source <(pb completions zsh)
source <(pollapo completions zsh)

# some aliases
alias eixt="exit"
alias zshrc="vi ~/.zshrc"

