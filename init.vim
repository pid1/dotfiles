" Built-in search: The Better EasyMotion (TM)
set incsearch
set nohlsearch

" Custom leader
let mapleader = "\<Space>"

" Search highlight quick toggle
nnoremap <leader><space> :call HighlightToggle()<cr>

" Double tap space in normal mode
let g:highlightsearch = 0
function! HighlightToggle()
    if g:highlightsearch
        set nohlsearch
        let g:highlightsearch = 0
    else
        set hlsearch
        let g:highlightsearch = 1
    endif
endfunction

" UX
set noerrorbells
set autoread
set ruler
set hlsearch
set ignorecase
set smartcase
set lazyredraw
set colorcolumn=80
set background=light

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Let's be smart about indentation, including custom per-filetype
set nocompatible
filetype plugin indent on
set autoindent

"syntax highlighting, numbering
set number
syntax on

" Be smart about case sensitivity
set ignorecase
set smartcase

" Anything but utf-8 is silly
set encoding=utf-8