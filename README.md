# Dotfiles repo
Bring this config to a new machine:
Variables:
branch: desired from this config that you want to install
shell: desired shell interpreter yo would like to use(currently only set up for `zsh`)
```
git clone https://github.com/jaredzieche/dotfiles.git
```
```
./install.sh ${branch} ${interpreter}
```

## Current Setup:
Currently running mostly in RHEL but have tested in latest ubuntu and osx as well.
- neovim 5.0
  - nvim.coc for auto complete, lsp and snippets
- zsh
- powerlevel10k prompt

## TODO
- Move into full lua config with native neovim lsp support.
- add multiple options for shell installation
- refine installation script an add in more ansible configuration options/tasks to react per OS distro
![image](https://user-images.githubusercontent.com/28032466/137920716-741335c6-4bbf-43e7-8b53-a9c1132a757b.png)
