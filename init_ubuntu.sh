#!/usr/bin/env sh

# passwd
: "
sudo passwd
sudo passwd $(whoami)
"

# apt init
: "
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt install git
"

# git config
git config --global user.email "jongho.jeon@riiid.co"
git config --global user.name "Jongho Jeon"
git config --global push.default simple

# Add gradle 6.0.1 repo
sudo add-apt-repository ppa:cwchien/gradle

# install pkgs
PKGS="vim-gnome
curl
wget
tree
zsh
git
gradle
openjdk-8-jdk
python3-dev
"
sudo apt -y install $PKGS



# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
: "chsh $(which zsh)"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# set up vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall



# kotlin-vim
git clone https://github.com/udalov/kotlin-vim.git ~/.vim/pack/plugins/start/kotlin-vim



# install fasd
: "
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get install fasd
"

# ultimate vimrc
: "
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
"

