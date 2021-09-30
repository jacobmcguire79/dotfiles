" Plugins
let mapleader = ','
call plug#begin('~/.config/nvim/plugged')
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kevinhwang91/nvim-bqf'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/vimux'
Plug 'roxma/nvim-yarp'          " Required before deoplete
Plug 'roxma/vim-hug-neovim-rpc' " Required before deoplete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'itchyny/lightline.vim'
Plug 'hoob3rt/lualine.nvim'
" Nerdtree
"Plug 'preservim/nerdtree' |
"            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
"            \ Plug 'scrooloose/nerdtree' |
"            \ Plug 'ryanoasis/vim-devicons'
" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" SnipRun
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
" Neoclide COC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Language Server support
" Snippets
Plug 'honza/vim-snippets'
Plug 'phenomenes/ansible-snippets'
" Syntax and generic language specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'towolf/vim-helm'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'pearofducks/ansible-vim'
Plug 'neovim/nvim-lspconfig'
" Ruby specific
"Plug 'vim-ruby/vim-ruby' " For Facts, Ruby functions, and custom providers
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-rake'
"Plug 'danchoi/ri.vim'
"Plug 'thoughtbot/vim-rspec'
"Plug 'ngmy/vim-rubocop'
" Colorschemes
Plug 'chuling/equinusocio-material.vim'
Plug 'marko-cerovac/material.nvim'
" Testing
Plug 'tpope/vim-dispatch'
"Plug 'vim-test/vim-test'
"Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
call plug#end()
