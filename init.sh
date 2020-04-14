#!/usr/bin/env sh

DOTFILES_ROOT=$(dirname $0)

ln -s      $DOTFILES_ROOT/.ideavimrc   ~/.ideavimrc
echo ln -s $DOTFILES_ROOT/.ideavimrc   ~/.ideavimrc
ln -s      $DOTFILES_ROOT/.vim_runtime ~/.vim_runtime
echo ln -s $DOTFILES_ROOT/.vim_runtime ~/.vim_runtime
ln -s      $DOTFILES_ROOT/.vimrc       ~/.vimrc
echo ln -s $DOTFILES_ROOT/.vimrc       ~/.vimrc
ln -s      $DOTFILES_ROOT/.zshrc       ~/.zshrc
echo ln -s $DOTFILES_ROOT/.zshrc       ~/.zshrc

# for windows
ln -s      $DOTFILES_ROOT/win/.bashrc  /.bashrc
echo ln -s $DOTFILES_ROOT/win/.bashrc  /.bashrc
