" ============================
" Basic Vim Settings
" ============================
set nocompatible             " Use Vim defaults, not vi
set clipboard+=unnamedplus   " Use system clipboard
set go+=a                    " Append to 'formatoptions'

set expandtab                " Use spaces instead of tabs
set tabstop=2                " Number of spaces per tab
set softtabstop=2            " Number of spaces when editing
set shiftwidth=2             " Number of spaces for autoindent

set termguicolors            " Enable true colors for gruvbox
set background=dark          " Dark background (change to light if needed)
set showcmd                  " Show partial commands
set showmatch                " Highlight matching brackets
set ignorecase               " Case-insensitive search
set smartcase                " Respect uppercase
set incsearch                " Incremental search
set autowrite                " Auto save before commands
set hidden                   " Allow switching buffers without saving
set number                   " Show line numbers
set mouse=a                  " Enable mouse
set wrap                     " Wrap long lines
set modelines=0              " Disable modelines

" ============================
" Plugin Management (vim-plug)
" ============================
call plug#begin('~/.vim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" Colorscheme
Plug 'gruvbox-community/gruvbox'

" File explorers & language support
Plug 'preservim/nerdtree'
Plug 'hashivim/vim-terraform'
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim'
Plug 'stephpy/vim-yaml'

" Git integration
Plug 'tpope/vim-fugitive'

call plug#end()

" ============================
" Syntax and Colorscheme
" ============================
syntax on                    " Enable syntax highlighting
colorscheme gruvbox           " Load gruvbox colorscheme

" ============================
" Filetype & Indentation
" ============================
filetype plugin indent on    " Enable filetype plugins and indentation

" Better YAML detection for Ansible
autocmd BufRead,BufNewFile *.yml,*.yaml set filetype=yaml.ansible

" ============================
" NERDTree Settings
" ============================
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Open NERDTree when starting Vim with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close Vim if NERDTree is the only window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif

" ============================
" Copy & Paste Mappings
" ============================
" Copy to system clipboard
noremap <C-c> "+y
vnoremap <C-c> "+y

" Toggle paste mode to prevent extra line breaks
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set showmode

" ============================
" Fugitive Statusline
" ============================
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

