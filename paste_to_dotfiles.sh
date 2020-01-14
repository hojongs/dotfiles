#!/usr/bin/env sh

DST=~/dotfiles
SRC=~

for f in ".zshrc .vimrc .vim_runtime/my_configs.vim .ideavimrc"
do
    cp -r $DST/$f $DST/$f.bak
    cp -r $SRC/$f $DST
done
