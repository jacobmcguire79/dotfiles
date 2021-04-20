# Dotfiles repo
Bring this config to a new machine:
```shell
$ echo ".cfg" >> .gitignore
$ git clone --bare https://github.com/jaredzieche/dotfiles.git $HOME/.cfg
$ alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
$ config config --local status.showUntrackedFiles no
$ config checkout
```
Add a file:
```shell
$ config add somefile
$ config commit -m "added somefile"
$ config push
```
Update Submodules:
```shell
$ config submodule update --init --recursive
```
