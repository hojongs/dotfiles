#!/usr/bin/env sh
git config --global user.email "jongho.jeon@riiid.co"
git config --global user.name "Jongho Jeon"

# gradle 6.0.1
sudo add-apt-repository ppa:cwchien/gradle

PKGS="gradle \
    "
sudo apt -y install $PKGS

sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get install fasd

# YCM submodule update
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive

# upgrade packages
sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove


