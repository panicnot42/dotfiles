#!/bin/bash
curl -L http://sourceforge.net/projects/cedet/files/cedet/cedet-1.1.tar.gz/download -o cedet-1.1.tar.gz

ln -sT dotfiles/.emacs .emacs
ln -T dotfiles/.zshrc .zshrc
ln -T dotfiles/conky/.conkyrc .conkyrc

ln -sT dotfiles/oh-my-zsh .oh-my-zsh
ln -sT dotfiles/.i3 .i3
ln -sT dotfiles/.emacs.d .emacs.d
