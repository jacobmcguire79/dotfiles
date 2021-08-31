#!/bin/bash

config = "/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

if [[ ! -f "$HOME/.cfg" ]]; then
  echo ".cfg" >> .gitignore
  git clone --bare https://github.com/jaredzieche/dotfiles.git $HOME/.cfg --recurse-submodules
  $config config --local status.showUntrackedFiles no
  $config checkout
  $config git submodule --init --recursive
fi

if [[ ! -x $(which ansible) ]]; then
  pip install ansible
fi

if [[ -x $(which ansible) ]]; then
  ansible-playbook install.yml
fi

if [[ ! -f "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  sudo chsh -s $(which zsh) $(whoami)
fi

if [[ -f "$HOME/.zshrc" ]]; then
  rm -f "$HOME/.zshrc"
fi
