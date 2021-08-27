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
  /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME config --local status.showUntrackedFiles no
  /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME checkout
fi

if [[ ! -f "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
