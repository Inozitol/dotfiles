""""""" Plugin management stuff """""""
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" Custom plugins...
Plug 'easymotion/vim-easymotion'

" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
" Ctrl-P - Fuzzy file search
Plug 'kien/ctrlp.vim'
" Neomake build tool (mapped below to <c-b>)
Plug 'benekastah/neomake'
" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'

" Status bar mods
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'

" Python code folding
" Plug 'tmhedberg/SimpylFold'

" Code completer
" Plug 'neoclide/coc.nvim'

" Plug 'dense-analysis/ale'

" After all plugins...
call plug#end()
filetype plugin indent on

""""""" General coding stuff """""""
" Highlight 80th column
"set colorcolumn=80
" Always show status bar
set laststatus=2
" Let plugins show effects after 100ms, not 4s
set updatetime=100
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

set encoding=utf8

""""""" Python stuff """""""
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1

""""""" Keybindings """""""
" Set up leaders
let mapleader=","

" Linux / windows ctrl+backspace ctrl+delete
" Note that ctrl+backspace doesn't work in Linux, so ctrl+\ is also available
imap <C-backspace> ú
imap <C-\> ú
imap <C-delete> ø

" Neomake and other build commands (ctrl-b)
nnoremap <C-b> :w<cr>:Neomake<cr>

autocmd BufNewFile,BufRead *.tex,*.bib noremap <buffer> <C-b> :w<cr>:new<bar>r !make<cr>:setlocal buftype=nofile<cr>:setlocal bufhidden=hide<cr>:setlocal noswapfile<cr>
autocmd BufNewFile,BufRead *.tex,*.bib imap <buffer> <C-b> <Esc><C-b>

"nnoremap Y "+y
"vnoremap Y "+y
"nnoremap yY ^"+y$

set clipboard+=unnamedplus
