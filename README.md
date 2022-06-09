Dotfiles repo
Bring this config to a new machine:

Automated:

sh -c "`curl -fsSL https://raw.githubusercontent.com/jacobmcguire79/dotfiles/master/install.sh`"
Manually:

echo ".cfg" >> .gitignore
git clone --bare https://github.com/jacobmcguire79/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
Add a file:

config add somefile
config commit -m "added somefile"
config push
