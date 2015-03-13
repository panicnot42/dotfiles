#!/bin/bash
ln -T dotfiles/.emacs .emacs
ln -T dotfiles/.zshrc .zshrc
ln -T dotfiles/conky/.conkyrc .conkyrc

ln -sT dotfiles/oh-my-zsh .oh-my-zsh
ln -sT dotfiles/.i3 .i3

git clone https://github.com/panicnot42/git-achievements.git
