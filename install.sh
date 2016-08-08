#!/bin/bash

echo "Installing dankeroni's dotfiles..."

directories=(.config/nvim)
files=(.bash_aliases .bash_exports .bashrc .gitconfig .gitignore .profile .config/nvim/init.vim \
    .tmux.conf)

for directory in "${directories[@]}"; do
    mkdir -p ~/$directory
done

for file in "${files[@]}"; do
    ln -s `pwd`/$file ~/$file
done

echo "Done"
