#!/bin/bash

echo "Installing dankeroni's dotfiles..."

directories=(.config/nvim .gnupg)
files=(.bash_aliases .bash_exports .bashrc .gitconfig ..profile .config/nvim/init.vim \
    .tmux.conf .gdbinit .vimrc commitlint.config.js \
    .editorconfig .clang-format .gnupg/gpg-agent.conf .condarc)

for directory in "${directories[@]}"; do
    mkdir -p ~/$directory
done

for file in "${files[@]}"; do
    ln -sf `pwd`/$file ~/$file
done

echo "Done"
