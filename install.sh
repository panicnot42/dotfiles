#!/bin/bash
git submodule update

make -C dotfiles/.emacs.d/cedet clean-all
make -C dotfiles/.emacs.d/cedet

ln -sT dotfiles/.emacs .emacs
ln -T dotfiles/.zshrc .zshrc
ln -T dotfiles/conky/.conkyrc .conkyrc

ln -sT dotfiles/oh-my-zsh .oh-my-zsh
ln -sT dotfiles/.i3 .i3
ln -sT dotfiles/.emacs.d .emacs.d
