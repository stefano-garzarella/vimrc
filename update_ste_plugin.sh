#!/bin/bash
ORIG_DIR = $PWD

if [ -e sources_non_forked/jedi-vim/.git ]; then
    git pull --rebase
else
    git clone https://github.com/davidhalter/jedi-vim sources_non_forked/jedi-vim
fi
cd sources_non_forked/jedi-vim
git submodule update --init --recursive
cd $ORIG_DIR


if [ -e sources_non_forked/YouCompleteMe/.git ]; then
    git pull --rebase
else
    git clone https://github.com/Valloric/YouCompleteMe sources_non_forked/YouCompleteMe
fi
cd sources_non_forked/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cd $ORIG_DIR 
