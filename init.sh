#!/usr/bin/env sh

DOTFILES_ROOT=$(dirname $(realpath $0))
echo DOTFILES_ROOT=$DOTFILES_ROOT

echo echo: ln -s $DOTFILES_ROOT/.ideavimrc   ~/.ideavimrc
ln -s      $DOTFILES_ROOT/.ideavimrc   ~/.ideavimrc
echo echo: ln -s $DOTFILES_ROOT/.vim_runtime ~/.vim_runtime
ln -s      $DOTFILES_ROOT/.vim_runtime ~/.vim_runtime
echo echo: ln -s $DOTFILES_ROOT/.vimrc       ~/.vimrc
ln -s      $DOTFILES_ROOT/.vimrc       ~/.vimrc
echo echo: ln -s $DOTFILES_ROOT/.zshrc       ~/.zshrc
ln -s      $DOTFILES_ROOT/.zshrc       ~/.zshrc

# for windows
echo echo: ln -s $DOTFILES_ROOT/win/.bashrc  ~/.bashrc
ln -sf      $DOTFILES_ROOT/win/.bashrc  ~/.bashrc

