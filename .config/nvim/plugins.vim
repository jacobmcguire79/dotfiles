" Plugins
let mapleader = ','
call plug#begin('~/.config/nvim/plugged')
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kevinhwang91/nvim-bqf'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'roxma/nvim-yarp'          " Required before deoplete
Plug 'roxma/vim-hug-neovim-rpc' " Required before deoplete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
" Nerdtree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'scrooloose/nerdtree' |
            \ Plug 'ryanoasis/vim-devicons'
" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
" Neoclide COC
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Language Server support
" Snippets
Plug 'honza/vim-snippets'
Plug 'phenomenes/ansible-snippets'
" Syntax and generic language specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'towolf/vim-helm'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'pearofducks/ansible-vim'
" Ruby specific
Plug 'vim-ruby/vim-ruby' " For Facts, Ruby functions, and custom providers
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'danchoi/ri.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
" Colorschemes
Plug 'chuling/equinusocio-material.vim'
call plug#end()
