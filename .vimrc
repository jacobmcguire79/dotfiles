set nocompatible              " be iMproved, required
filetype off                  " required
set expandtab
set shiftwidth=2
set number
set t_Co=256
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pearofducks/ansible-vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/jzieche/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Bundle 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround', {'autoload': {'filetypes': ['yaml','yml','tf','json','python']} }
Plugin 'tpope/vim-obsession'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"autocmd FileType yml setlocal et ts=2 ai sw=2 nu sts=0
let g:ansible_unindent_after_newline = 1
colorscheme tender
let g:surround_insert_tail = "<++>"
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
" The above command works fine but some colorschemes don't highlight well
" enough so we use the following to highlight extra whitespace.
" Setup a highlight group
highlight ExtraWhitespace ctermbg=red guibg=red
" Match trailing whitespace except when typing
match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e
" diff customizations
command! Difft [NERDTreeToggle] windo diffthis
command! Diffo windo diffoff
