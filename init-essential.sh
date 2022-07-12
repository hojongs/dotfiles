#!/usr/bin/env bash
set -euxo pipefail

# Color: echo -e "I ${RED}love${NC} Stack Overflow"
# https://stackoverflow.com/a/5947802/12956829
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'

DARK_GRAY='\033[1;30m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if [[ $OSTYPE =~ ^darwin ]]
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
BREW_FORMULAE=

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

git submodule update --init

# oh-my-zsh
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    brew install zsh
else
    sudo apt-get install zsh
fi

# vim clipboard
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    brew install vim
else
    sudo apt-get install vim-gtk3 -y
fi

# gh: GitHub CLI
if ! command -v gh &> /dev/null
then
    echo "${RED}gh not found. Install it$NC"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" gh"
    else
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
        sudo apt update
        sudo apt install gh
        gh auth login
    fi
fi

# jq : JSON processor
# https://github.com/stedolan/jq
if ! command -v jq &> /dev/null
then
    echo "${RED}jq not found. Install it$NC"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" jq"
    else
        sudo apt-get install jq
    fi
fi

# rg : ripgrep
# https://github.com/BurntSushi/ripgrep#installation
if ! command -v rg &> /dev/null
then
    echo "${RED}rg not found. Install it$NC"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" ripgrep"
    else
        sudo apt-get install ripgrep
    fi
fi

# fd
# https://github.com/sharkdp/fd
if ! command -v fd &> /dev/null
then
    echo "${RED}fd not found. Install it$NC"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" fd"
    else
        sudo apt install fd-find
    fi
fi

# fzf
# https://github.com/junegunn/fzf
if ! command -v fzf &> /dev/null
then
    echo "${RED}fzf not found. Install it$NC"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" fzf"
    else
        sudo apt-get install fzf
    fi
fi

# fd for fzf
# https://github.com/sharkdp/fd
if ! command -v fzf &> /dev/null
then
    echo "${RED}fd not found. Install it$NC"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" fd"
    else
        sudo apt-get install fd-find
    fi
fi

# diff-so-fancy: alternative to diff, git diff
# https://github.com/so-fancy/diff-so-fancy
if ! command -v diff-so-fancy &> /dev/null
then
    echo "${RED}diff-so-fancy not found. Install it$NC"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" diff-so-fancy"
    else
        sudo add-apt-repository ppa:aos1/diff-so-fancy && \
          sudo apt-get update && \
          sudo apt-get install diff-so-fancy
    fi
fi

# amix/vimrc
if [[ ! -d "$HOME/.vim_runtime" ]]
then
    git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
    sh $HOME/.vim_runtime/install_basic_vimrc.sh
fi

# vim plugins
VIM_PACK_ROOT=$HOME/.vim/pack
# surround.vim
VIM_PACK_SURROUND_ROOT=$VIM_PACK_ROOT/tpope/start/surround
if [[ ! -d $VIM_PACK_SURROUND_ROOT ]]
then
    mkdir -p ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/surround.git $VIM_PACK_SURROUND_ROOT
    vim -u NONE -c "helptags surround/doc" -c q
fi
unset VIM_PACK_SURROUND_ROOT
# repeat.vim
VIM_PACK_REPEAT_ROOT=$VIM_PACK_ROOT/tpope/start/repeat
if [[ ! -d $VIM_PACK_REPEAT_ROOT ]]
then
    mkdir -p ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/repeat.git $VIM_PACK_REPEAT_ROOT
fi
unset VIM_PACK_REPEAT_ROOT
# sensible.vim
VIM_PACK_SENSIBLE_ROOT=$VIM_PACK_ROOT/tpope/start/sensible
if [[ ! -d $VIM_PACK_SENSIBLE_ROOT ]]
then
    mkdir -p ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/sensible.git $VIM_PACK_SENSIBLE_ROOT
fi
unset VIM_PACK_SENSIBLE_ROOT
# Add more vim plugins here...
unset VIM_PACK_ROOT

if [[ $ZSHRC_DIST = 'darwin' ]]
then
    if  [[ $BREW_FORMULAE ]]
    then
        brew install $BREW_FORMULAE
    else
        echo "${BLUE}All homebrew formulae installed."
    fi
fi

# tree
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    brew install tree
else
    sudo apt-get install tree
fi

# dos2unix
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    brew install dos2unix
else
    sudo apt-get install dos2unix
fi

# starship
if [[ $ZSHRC_DIST = 'darwin' ]]
then
    brew install starship
else
    sudo apt-get install starship
fi

