#!/usr/bin/env sh

DST=~/dotfiles
SRC=~

for f in .zshrc .vimrc .ideavimrc
do
    echo "cp $SRC/$f $DST/"
    cp $SRC/$f $DST/
    echo
done

echo "cp $SRC/.vim_runtime/my_configs.vim $DST/.vim_runtime/my_configs.vim"
cp $SRC/.vim_runtime/my_configs.vim $DST/.vim_runtime/my_configs.vim

