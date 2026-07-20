syntax enable

set nocompatible
set laststatus=2
set number
set ruler
set showcmd
set wildmenu
set backspace=indent,eol,start
set incsearch
set hlsearch
set ignorecase
set smartcase
set undofile
set undodir=~/.vim/undo//

" From `:help :DiffOrig`.
if exists(":DiffOrig") != 2
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
        \ | diffthis | wincmd p | diffthis
endif