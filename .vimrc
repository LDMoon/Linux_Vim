" Created by L.D.Moon
" Vim Settings without changing .viminfo

" PLUG INS
call plug#begin()

" Color Theme
Plug 'sainnhe/everforest'

call plug#end()

" Set Theme
    if has('termguicolors')
        set termguicolors
    endif

    set background=dark
    let g:everforest_background = 'hard'
    let g:everforest_better_performance = 1
    colorscheme everforest

" Set Numbers to get line number to show
:set nu

" Set Relative Numbers for the rest
:set rnu

" Set all tabs to 4 spaces
:set tabstop=4

" Shift width 4 spaces
:set shiftwidth=4

" Tab is broken into 4 space characters 
:set expandtab

" Create a grey column at 80 chars
:set colorcolumn=81

" Set cursor to be roughly middle
:set scrolloff=20

" Crosshair for the cursor
:set cursorline
:set cursorcolumn
":highlight cursorline cterm=NONE 
":highlight cursorcolumn 

" Auto Indent
:set autoindent

" Smart Indent
:set smartindent

" Keep Line Formatting
:set formatoptions+=cro

" Show Syntax
syntax on

" Aliases
" This opens a terminal in a new tab quickly.
:command TT tab terminal
