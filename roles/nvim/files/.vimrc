set number
set nocompatible
syntax on
filetype plugin indent on

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
call plug#end()

" For vim-colors-solarized plugin
silent! set background=dark
silent! colorscheme solarized
set ruler
" let g:solarized_termcolors=256 " Needed when when terminal is not set to solarized
set cursorline
set colorcolumn=80
set t_Co=256
