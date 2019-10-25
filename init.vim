call plug#begin('~/.vim/plugged')
    " Syntax Checking
    Plug 'vim-syntastic/syntastic'
    " Highlight whitespace
    Plug 'pid1/spacehi.vim'
    " Completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

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

" 4 column expanded tabs by default
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"syntax highlighting, numbering
set number
syntax on

" Be smart about case sensitivity
set ignorecase
set smartcase

" Anything but utf-8 is silly
set encoding=utf-8

" Deoplete options
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()

" Status line and Syntastic Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height=10
let g:syntastic_sh_shellcheck_args="-x"
let g:airline_theme='solarized'
