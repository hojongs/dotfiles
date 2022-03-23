#!/usr/bin/env bash

# git config
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig

# vim
ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

# zsh
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -s $HOME/dotfiles/.zprofile $HOME/.zprofile

# GitHub CLI config
mkdir -p $HOME/.config/gh && \
  ln -s $HOME/dotfiles/.config/gh/config.yml $HOME/.config/gh/config.yml

# starship
ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml
