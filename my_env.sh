#!/bin/bash
# Not yet a runnable script just steps with installed configurations
# add ssh key to github
ssh-keygen -f ~/.ssh/id_rsa
# FOR OSX
# ZSH install and auto suggest additions
git clone https://github.com/ohmyzsh/ohmyzsh.git
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i s/'plugins=(git)'/'plugins=(git zsh-autosuggestions)'/g ~/.zshrc

# Powerlevel theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"
sed -i s/'RobbyRussel'/'powerlevel9k/powerlevel9k'/g ~/.zshrc

# CONDA
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
~/miniconda.sh -b -p $HOME/miniconda

# add zsh files
git clone git@github.com:JaredZieche/my_env.git
# FOR WINDOWS/WSL
