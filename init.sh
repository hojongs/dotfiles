#!/usr/bin/env sh

DOTFILES_ROOT=~/dotfiles

ln -s $DOTFILES_ROOT/.ideavimrc   ~/.ideavimrc
ln -s $DOTFILES_ROOT/.vim_runtime ~/.vim_runtime
ln -s $DOTFILES_ROOT/.vimrc       ~/.vimrc
ln -s $DOTFILES_ROOT/.zshrc       ~/.zshrc

