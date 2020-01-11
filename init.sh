#!/usr/bin/env sh
git config --global user.email "jongho.jeon@riiid.co"
git config --global user.name "Jongho Jeon"

# gradle 6.0.1
sudo add-apt-repository ppa:cwchien/gradle

PKGS="gradle \
    "
sudo apt -y install $PKGS

