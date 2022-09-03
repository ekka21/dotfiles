#!/bin/bash
set -ex

git clone git@github.com:ekka21/dotfiles.git
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.p10k.zsh ~/.10k.zsh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
