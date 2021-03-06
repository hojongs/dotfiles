#!/usr/bin/env sh

SRC=~/dotfiles
DST=~

for f in .zshrc .vimrc .ideavimrc
do
    echo "cp $DST/$f $DST/$f.bak"
    cp $DST/$f $DST/$f.bak
    echo "cp $SRC/$f $DST/"
    cp $SRC/$f $DST/
    echo
done

echo "cp $SRC/.vim_runtime/my_configs.vim $DST/.vim_runtime/my_configs.vim"
cp $SRC/.vim_runtime/my_configs.vim $DST/.vim_runtime/my_configs.vim

