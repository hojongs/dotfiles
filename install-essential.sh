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

# zsh-navigation-tools : Ctrl-R
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-navigation-tools
if [[ ! -d "$HOME/.config/znt/zsh-navigation-tools/" ]]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zsh-navigation-tools/master/doc/install.sh)"
fi

# jq : JSON processor
# https://github.com/stedolan/jq
if ! command -v jq &> /dev/null
then
    echo "${RED}jq not found. Install it"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" jq"q
    else
        echo "${RED}jq TBD"
    fi
fi

# rg : ripgrep
# https://github.com/BurntSushi/ripgrep#installation
if ! command -v rg &> /dev/null
then
    echo "${RED}rg not found. Install it"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" ripgrep"
    else
        echo "${RED}ripgrep TBD"
    fi
fi

# fzf
# https://github.com/junegunn/fzf
if ! command -v fzf &> /dev/null
then
    echo "${RED}fzf not found. Install it"
    if [[ $ZSHRC_DIST = 'darwin' ]]
    then
        BREW_FORMULAE+=" fzf"
    else
        echo "${RED}fzf TBD"
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

if [[ $BREW_FORMULAE ]]
then
    brew install $BREW_FORMULAE
else
    echo "${BLUE}All homebrew formulae installed."
fi

