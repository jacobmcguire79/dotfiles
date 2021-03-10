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
$ git submodule update --init --recursive
```
Thanks to the author of these instructions: [Gabrielle Young](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained)
