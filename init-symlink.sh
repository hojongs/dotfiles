#!/usr/bin/env bash
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -s $HOME/dotfiles/.zprofile $HOME/.zprofile
mkdir -p $HOME/.config/gh && \
  ln -s $HOME/dotfiles/.config/gh/config.yml $HOME/.config/gh/config.yml
