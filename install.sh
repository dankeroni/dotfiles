#!/bin/bash

echo "Installing dankeroni's dotfiles..."

directories=(.config/nvim .config/awesome .icons/default)
files=(.bash_aliases .bash_exports .bashrc .gitconfig .gitignore .profile .config/nvim/init.vim \
    .tmux.conf .config/awesome/rc.lua .icons/default/index.theme .inputrc)

for directory in "${directories[@]}"; do
    mkdir -p ~/$directory
done

for file in "${files[@]}"; do
    ln -s `pwd`/$file ~/$file
done

ln -s /usr/share/icons/Breeze_Snow/cursors ~/.icons/default/cursors

echo "Done"
