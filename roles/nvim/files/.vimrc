set number
set nocompatible
syntax on
filetype plugin indent on

" -- Search
set ignorecase " Ignore case when searching
set smartcase " If there is an uppercase in your search term
" search case sensitive again
set incsearch " Highlight search results when typing
set hlsearch " Highlight search results


" Lean vim the hardway
" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Clear highligh on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/nvie/vim-flake8.git', { 'for': 'python'}
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'https://github.com/leafgarland/typescript-vim.git', {'for': 'typescript'}
call plug#end()

" For vim-colors-solarized plugin
silent! set background=dark
silent! colorscheme solarized
set ruler
" let g:solarized_termcolors=256 " Needed when when terminal is not set to solarized
set cursorline
set colorcolumn=80
set t_Co=256


" Show whitespace characters
set list
set listchars=tab:▸\ ,eol:¬,trail:▫

set tabstop=4
set expandtab

set clipboard+=unnamedplus
