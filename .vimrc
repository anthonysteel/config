" pet nocompatible
filetype off

hi Normal guibg=NONE ctermbg=NONE

" set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe' "syntactic completion for vim
Plugin 'terryma/vim-multiple-cursors' "multiple cursors ala sublime
Plugin 'airblade/vim-gitgutter' "shows git diff to the left of line numbers
Plugin 'scrooloose/nerdtree' "system file explorer
Plugin 'pangloss/vim-javascript'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized' "solarized syntax highlighting
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'heavenshell/vim-jsdoc'


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
set colorcolumn=80
" Change tabs to be 2 spaces for html files
au FileType html setl sw=2 ts=2 et
"vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:ariline#extensions#tabline#fnamemod = ':t'
"buffer config
set hidden
"new buffer tab
nmap <C-t> :enew<CR>
"new buffer
nmap <C-o> :badd 
"move to next buffer
nmap <C-f> :bnext<CR>
"move to previous buffer
nmap <C-d> :bprev<CR>
"close current buffer
nmap <C-x> :bd<CR>
"show all buffers and their status
nmap <C-b><C-l> :ls<CR>

"nerd tree open
map <C-t> :NERDTreeToggle<CR>
"open nerd tree if no file is specified upon opening vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"closing vim if the only window left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"shortcuts for vim splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"searching
set incsearch "search as characters appear
set hlsearch "highlight matches
nnoremap <leader><space> :nohlsearch<CR>

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
