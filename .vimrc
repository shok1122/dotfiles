let mapleader="\<Space>"

set number
set title
set ambiwidth=double
set tabstop=4
set noexpandtab
set shiftwidth=4
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set history=50
set wildmenu

syntax on

" search {
nmap n nzz
nmap N Nzz
nmap * *zz
" }

" =============================================================
"  save 
"    prefix: <Leader>
" =============================================================
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>

" =============================================================
"  copy 
"    prefix: <Leader>
" =============================================================
nmap <Leader>y yiw
nmap <Leader>( yi(
nmap <Leader>< yi<
nmap <Leader>" yi"
nmap <Leader>ay yaw
nmap <Leader>a( ya(
nmap <Leader>a< ya<
nmap <Leader>a" ya"

" =============================================================
"  move 
"    prefix: <Leader>
" =============================================================
nmap <Leader>l $
nmap <Leader>h ^
nmap <Leader>j G
nmap <Leader>k gg
nmap <Leader>/ *

" =============================================================
"  window 
"    prefix: s
" =============================================================
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>

