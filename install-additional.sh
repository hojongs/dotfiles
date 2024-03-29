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

if [[ ! -d $HOME_BIN ]]
then
    mkdir $HOME_BIN
fi

if [[ ! -d $ZSH_HOME_PATH ]]
then
    mkdir $ZSH_HOME_PATH
fi

if [[ ! -d $ZSH_HIDDEN_PATH ]]
then
    touch $ZSH_HIDDEN_PATH
fi

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

# kubectl
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

# kube-ps1
# https://github.com/jonmosco/kube-ps1
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

# pyenv-virtualenv
# https://github.com/pyenv/pyenv-virtualenv
if [[ ! -d $(pyenv root)/plugins/pyenv-virtualenv ]]
then
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

# git-fuzzy
# https://github.com/bigH/git-fuzzy
if [[ ! -d "$ZSH_HOME_PATH/git-fuzzy" ]]
then
    gh repo clone bigH/git-fuzzy $ZSH_HOME_PATH/git-fuzzy
fi

# java (adopt openjdk)
# https://github.com/AdoptOpenJDK/homebrew-openjdk
if ! command -v java &> /dev/null
then
    echo 'java not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew tap homebrew/cask-versions
        brew install --cask temurin8
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

# awscli
if ! command -v aws &> /dev/null
then
    echo 'awscli not found. Install it'
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install awscli
    fi
fi

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

if ! command -v watch &> /dev/null
then
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        brew install watch
    fi
fi
