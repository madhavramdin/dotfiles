" ============================
" Basic Settings
" ============================

set clipboard+=unnamedplus

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set termguicolors
set background=dark

set showcmd
set showmatch

set ignorecase
set smartcase
set incsearch

set autowrite

set number
set mouse=a
set wrap

set modelines=0

syntax enable
filetype plugin indent on

" ============================
" Neovim compatibility
" ============================

if has('nvim')
  let g:loaded_perl_provider=0
  let g:loaded_ruby_provider=0
endif

" ============================
" vim-plug bootstrap
" ============================

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'gruvbox-community/gruvbox'

Plug 'preservim/nerdtree'

Plug 'hashivim/vim-terraform'
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim'
Plug 'stephpy/vim-yaml'

Plug 'tpope/vim-fugitive'

call plug#end()

" ============================
" Theme
" ============================

colorscheme gruvbox

" ============================
" YAML / Ansible
" ============================

autocmd BufRead,BufNewFile *.yml,*.yaml set filetype=yaml.ansible

" ============================
" NERDTree
" ============================

let NERDTreeShowHidden=1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Toggle hidden files
nnoremap . :NERDTreeToggleHidden<CR>

" Open NERDTree on directory
autocmd VimEnter *
\ if argc()==1 && isdirectory(argv()[0]) |
\ execute 'NERDTree' argv()[0] |
\ wincmd p |
\ endif

" Close when NERDTree only
autocmd BufEnter *
\ if tabpagenr('$') == 1 &&
\ winnr('$') == 1 &&
\ exists('b:NERDTree') &&
\ b:NERDTree.isTabTree() |
\ quit |
\ endif

" ============================
" Clipboard
" ============================

nnoremap <C-c> "+y
vnoremap <C-c> "+y

" ============================
" Paste toggle (Neovim safe)
" ============================

nnoremap <F2> :set paste!<CR>

" ============================
" Statusline
" ============================

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
