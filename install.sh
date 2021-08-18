#!/bin/bash
good = true

if [[ ! -x $(which git) ]]; then
  good = false
  echo "git is not installed."
fi

if [[ ! -x $(which zsh) ]]; then
  good = false
  echo "zsh is not installed."
fi

if [[ -f "$HOME/.zshrc" ]]; then
  rm -f "$HOME/.zshrc"
fi

if [[ ! -f "$HOME/.cfg" ]]; then
  echo ".cfg" >> .gitignore
  git clone --bare https://github.com/jaredzieche/dotfiles.git $HOME/.cfg --recurse-submodules
  alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
  config config --local status.showUntrackedFiles no
  config checkout
fi
