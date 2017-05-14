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

" =============================================================
"  coding 
" =============================================================
if has("path_extra")
	set tags+=tags;
endif

" =============================================================
"  neobundle 
" =============================================================
" neobundle settings {{{
if has('vim_starting')
	set nocompatible
	" neobundle をインストールしていない場合は自動インストール
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install neobundle..."
		" vim からコマンド呼び出しているだけ neobundle.vim のクローン
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
	" runtimepath の追加は必須
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', {
	\ 'depends' : 'Shougo/unite.vim'
	\ }
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'windows' : 'make -f make_mingw32.mak',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'unix' : 'make -f make_unix.mak',
	\    },
	\ }
if has('lua')
	NeoBundleLazy 'Shougo/neocomplete.vim', {
	\ 'depends' : 'Shougo/vimproc',
	\ 'autoload' : { 'insert' : 1,}
	\ }
endif
NeoBundleLazy 'Shougo/vimshell', {
	\ 'depends' : 'Shougo/vimproc',
	\ 'autoload' : {
	\ 	'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
	\ 	'VimShellExecute', 'VimShellInteractive',
	\ 	'VimShellTerminal', 'VimShellPop'],
	\ 	'mappings' : ['<Plug>(vimshell_switch)']
	\ }}
NeoBundle "scrooloose/syntastic"
NeoBundleLazy "majutsushi/tagbar", {
  \ 	"autoload": { "commands": ["TagbarToggle"]
  \ }}
NeoBundleLazy "scrooloose/nerdtree", {
      \ "autoload" : { "commands": ["NERDTreeToggle"] }}
NeoBundleLazy "wesleyche/SrcExpl", {
      \ "autoload" : { "commands": ["SrcExplToggle"]}}

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

set t_Co=256
syntax on
colorscheme jellybeans

" =============================================================
"  neobundle 
"      unite
" =============================================================
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q

" =============================================================
"  neobundle 
"      neocomplete
" =============================================================
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

" =============================================================
"  neobundle 
"      vimshell
" =============================================================
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>

" =============================================================
"  neobundle 
"      syntastic
" =============================================================
if ! empty(neobundle#get("syntastic"))
	" Disable automatic check at file open/close
	let g:syntastic_check_on_open=0
	let g:syntastic_check_on_wq=0
	" C
	let g:syntastic_c_check_header = 1
	" C++
	let g:syntastic_cpp_check_header = 1
	" Java
	"let g:syntastic_java_javac_config_file_enabled = 1
	"let g:syntastic_java_javac_config_file = "$HOME/.syntastic_javac_config"
endif

" =============================================================
"  neobundle 
"      tagbar, SrcExpl, nerdtree
" =============================================================
" tagbar {
if ! empty(neobundle#get("tagbar"))
	" Width (default 40)
	let g:tagbar_width = 20
	" Map for toggle
	nn <silent> <leader>t :TagbarToggle<CR>
endif
" }

" SrcExpl {
if ! empty(neobundle#get("SrcExpl"))
	" Set refresh time in ms
	let g:SrcExpl_RefreshTime = 1000
	" Is update tags when SrcExpl is opened
	let g:SrcExpl_isUpdateTags = 0
	" Tag update command
	let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
	" Update all tags
	function! g:SrcExpl_UpdateAllTags()
		let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
		call g:SrcExpl_UpdateTags()
		let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
	endfunction
	" Source Explorer Window Height
	let g:SrcExpl_winHeight = 14
	" Mappings
	nn [srce] <Nop>
	nm <Leader>E [srce]
	nn <silent> [srce]<CR> :SrcExplToggle<CR>
	nn <silent> [srce]u :call g:SrcExpl_UpdateTags()<CR>
	nn <silent> [srce]a :call g:SrcExpl_UpdateAllTags()<CR>
	nn <silent> [srce]n :call g:SrcExpl_NextDef()<CR>
	nn <silent> [srce]p :call g:SrcExpl_PrevDef()<CR>
endif
" }

" nerdtree {
if ! empty(neobundle#get("nerdtree"))
	"                                                 endif
endif
" }

" toggle: tagbar, SrcExpl, nerdtree {
if ! empty(neobundle#get("nerdtree")) &&
	\! empty(neobundle#get("SrcExpl")) &&
	\! empty(neobundle#get("tagbar"))
	nn <silent> <Leader>A :SrcExplToggle<CR>:NERDTreeToggle<CR>:TagbarToggle<CR>
endif
" }
