if &compatible
  set nocompatible
endif
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('szw/vim-tags')
  call dein#add('ruby-matchit')
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('slim-template/vim-slim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('tpope/vim-endwise')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set nocompatible
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,sjis
set fileformat=unix
set fileformats=unix,mac,dos
set viminfo='20,\"1000
set tags=~/ruby.tags
filetype off
filetype plugin indent off

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
highlight SpecialKey cterm=NONE ctermfg=gray guifg=gray
highlight JpSpace cterm=underline ctermfg=gray guifg=gray
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

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

" mouse settings
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
  set nomousefocus
  set mousehide
endif
filetype plugin indent on
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
au BufNewFile,BufRead *.jade set ft=slim
au BufNewFile,BufRead *.es6 set ft=javascript
au BufNewFile,BufRead *.rb let g:vim_tags_project_tags_command = "ctags --languages=ruby -f ~/ruby.tags `pwd` 2>/dev/null &"
autocmd! FileType ruby setlocal sw=2 ts=2
autocmd! FileType eruby setlocal sw=2 ts=2
autocmd! FileType javascript setlocal sw=2 ts=2
autocmd! FileType jsx setlocal sw=2 ts=2
set history=10000
