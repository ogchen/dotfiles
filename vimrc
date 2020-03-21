set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set ruler
set number
set relativenumber
set backspace=indent,eol,start
set hlsearch
set incsearch
set nobackup
set noswapfile
set scrolloff=2
set wildmenu
set autochdir

set foldmethod=syntax
set nofoldenable
set foldnestmax=10
set foldlevel=10

set encoding=utf8

highlight MatchParen cterm=none ctermbg=yellow ctermfg=black
highlight Search cterm=none ctermfg=black ctermbg=lightblue

" Flag unnecessary whitespacce
au BufRead,BufNewFile *.py,*.cpp,*.h,*.hpp
            \ highlight BadWhitespace ctermbg=red guibg=darkred |
            \ match BadWhitespace /\s\+$/ |
            \ au InsertEnter * match BadWhitespace /\s\+\%#\@<!$/ |
            \ au InsertLeave * match BadWhitespace /\s\+$/

" Indentation for access modifiers
au BufEnter *.cpp,*.h,*.hpp
            \ set cindent | 
            \ set cino=g0

let mapleader=","

nnoremap <leader><leader>n :set invnumber invrelativenumber \| GitGutterToggle<CR>

"nnoremap <Space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ` .
vnoremap ` .

colorscheme gruvbox
set background=dark

let g:airline_theme = 'angr'

"Clang Format
autocmd FileType c,cpp map <buffer> = <Plug>(operator-clang-format)
let g:clang_format#style_options = {
  \   'BasedOnStyle': 'WebKit',
  \ }
