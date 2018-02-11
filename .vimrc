set nocompatible
filetype off

" set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe' "syntactic completion for vim
Plugin 'terryma/vim-multiple-cursors' "multiple cursors ala sublime
Plugin 'airblade/vim-gitgutter' "shows git diff to the left of line numbers
Plugin 'pangloss/vim-javascript'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized' "solarized syntax highlighting
Plugin 'AtsushiM/sass-compile.vim'

call vundle#end()
filetype plugin indent on
"colors
syntax enable
set background=dark
colorscheme solarized
"spaces and tabs
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
"ui config
set relativenumber "show relative line numbers
set showcmd "show command in bottom bar
set wildmenu "visual autocomplete
set lazyredraw "redraw only when needed
set colorcolumn=72
" Change tabs to be 2 spaces for html files
au FileType html setl sw=2 ts=2 et
"vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:ariline#extensions#tabline#fnamemod = ':t'
"buffer config
set hidden
"new buffer tab
nmap <C-t> :enew<CR>
"save buffer
nmap <C-s> :w<CR>
"new buffer
nmap <C-n> :badd 
"move to next buffer
nmap <C-l> :bnext<CR>
"move to previous buffer
nmap <C-h> :bprevious<CR>
"close current buffer
nmap <C-w> :bp <BAR> bd #<CR>
"show all buffers and their status
nmap <C-b><C-l> :ls<CR>
"searching
set incsearch "search as characters appear
set hlsearch "highlight matches
nnoremap <leader><space> :nohlsearch<CR>
"macros
map <C-O> O
map <C-o> o
"git commit text wrapping
au FileType gitcommit set tw=72
"set paste allows pasting from clip board
set pastetoggle=<C-v>

" Add JSX highlighting to non-JSX files
let g:jsx_ext_required = 0

" Create a mapping for js docs
nnoremap jsd :<C-u>call JSDocAdd()<CR>

" Turn off highlighting after searching
nnoremap i :noh<cr>i

