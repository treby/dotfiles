set nocompatible
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,sjis
set fileformat=unix
set fileformats=unix,mac,dos
set viminfo='20,\"1000

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'ruby-matchit'
NeoBundleCheck

filetype off
syntax on
set backspace=2
set title
set modelines=1
set modeline

set ts=4
set sw=4
set autoindent
set et

set number
set lcs=tab:>.,trail:_,extends:\
set list
set nowrap
set whichwrap=h,l
set nowrapscan
set incsearch
set hlsearch
set ignorecase
set showcmd
set showmatch
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/

let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,fc :foldclose<CR>

" mouse settings
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
  set nomousefocus
  set mousehide
endif
set history=10000
