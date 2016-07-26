#!/bin/bash

echo "Installing dankeroni's dotfiles..."

files=(.bash_aliases .bash_exports .bashrc .gitconfig .gitignore .profile .config/nvim/init.vim)

for file in "${files[@]}"; do
    ln -s `pwd`/$file ~/$file
done

echo "Done"
