""""""""""""""""""""""""""""
" Plugin specific settings "
"""""""""""""""""""""""""""

" ctrlp
" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrl_cmd = 'CtrlP'
" When invoked, unless a starting directory is specified, CtrlP will set its
" working directory according to this variable:
" r - nearing accestor with .git
" a - the directory of the current file
let g:ctrlp_working_path_mode = 'ra'
" Use gnu find for fast searching on linux
let g:ctrlp_user_command = "find %s -type f -not -name '^.*'"
" Exit on last <bs>
let g:ctrlp_brief_prompt = 1
" Exclude files and directories using wildignore and g:ctrlp_custom_ignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" ansible-vim
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ad"

" deoplete
let g:deoplete#enable_at_startup = 0
" use ^j and ^k to select autocompletions, disabled because we use those
" keybinds for tmux/split navigation
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" vim-test
let test#strategy = "neovim"
" ultest
"let test#python#pytest#options = "--color=yes"

" coc
let g:coc#enable_at_startup = 1
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-lua']

"call coc#config('https.rejectUnauthorized', {
"        \ 'value': false,
"        \})
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" lightline
let g:lightline = {
      \ 'colorscheme': 'equinusocio_material',
      \ 'active': {
      \    'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ },
      \ }
" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" close nerdtree automatically when I open a file
" let g:NERDTreeQuitOnOpen = 0
" close nerdtree if last buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabFree()) | q | endif
" open new tmux panes in current vim directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browser_split=4 " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" ri.vim: Change default mappings because they clash
nnoremap <Leader>ri :call ri#OpenSearchPrompt(0)<cr> "horizontal split
nnoremap <Leader>RI :call ri#OpenSearchPrompt(1)<cr> "vertical split
nnoremap <Leader>RK :call ri#LookupNameUnderCursor()<cr> " keyword lookup

" vim-rspec: add some shortcuts
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
