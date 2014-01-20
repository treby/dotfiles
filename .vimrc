set nocompatible

syntax on
set modelines=1
set modeline

set ts=4
set sw=4
set autoindent
set et

set number
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/

set mouse=a
set ttymouse=xterm2
set nomousefocus
set mousehide
