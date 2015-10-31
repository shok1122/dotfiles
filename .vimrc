" , をleaderに（,は\に退避）
let mapleader=","

" =============================================================
"  NeoBundle
" =============================================================
if has('vim_starting')
	" 初回起動時のみruntimepathにneobundleのパスを指定する
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" デフォルトのプロトコルを'https'に変更
let g:neobundle_default_git_protocol='https'

" neobundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグイン
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/caw.vim'
NeoBundle 't9md/vim-quickhl'
call neobundle#end()

" ファイルタイプ別のプラグイン／インデントを有効にする
filetype plugin indent on

" =============================================================
"  appearance
" =============================================================
" タブ関連
set tabstop=4
set shiftwidth=4
" 制御文字関連
set list
set listchars=eol:$,tab:>\ 
" 行番号表示
set number
" シンタックス表示
syntax on
set autochdir

" =============================================================
"  window 
"    prefix: s
" =============================================================
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" =============================================================
"  shift+* command
"    prefix: <Space>
" =============================================================
" 行末
nnoremap <Space>l $
" 行頭
nnoremap <Space>h ^
" 1行目
nnoremap <Space>j G
" 最終行
nnoremap <Space>k gg
" grep結果 次へ
nnoremap <Space>p :<C-u>cprev<CR>
" grep結果 前へ
nnoremap <Space>n :<C-u>cnext<CR>
" カーソル下の文字列を検索
nnoremap <Space>/ *

" =============================================================
"  unite
"    prefix: ,
" =============================================================
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
let g:unite_enable_split_vertically=0 " 横分割で開く
"let g:unite_winwidth=40 " 縦幅40で開く
let g:unite_winheight=10
nnoremap [unite] <NOP>
nmap <Leader>f [unite]
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"nnoremap <silent> [unite]f :<C-u>Unite file<CR>
nnoremap <silent> [unite]f :<C-u>Unite file_rec<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]u :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
"-- unite-outline
nnoremap <silent> [unite]o :<C-u>Unite outline
"-- unite-include
nnoremap <silent> [unite]i :<C-u>Unite file_include<CR>

" =============================================================
"  unite-tag
" =============================================================
"autocmd BufEnter *
"\	if empty(&buftype)
"\|		nnoremap <buffer> <C-]> :<C-u>:UniteWithCursorWord -immediately tag<CR>
"\|	endif

command!
    \ -nargs=? PopupTags
    "\ call <SID>TagsUpdate()
    \ |Unite tag:<args>

function! s:get_func_name(word)
	let end = match(a:word, '<\|[\|(')
	return end == -1 ? a:word : a:word[ : end-1 ]
endfunction

" カーソル下のワード(word)で絞り込み
" noremap <silent> g<C-]> :<C-u>execute "PopupTags ".expand('<cword>')<CR>

" カーソル下のワード(WORD)で ( か < か [ までが現れるまでで絞り込み
" 例)
" boost::array<std::stirng... → boost::array で絞り込み
noremap <silent> G<C-]> :<C-u>execute "PopupTags "
	\.substitute(<SID>get_func_name(expand('<cWORD>')), '\:', '\\\:', "g")<CR>

" =============================================================
"  neocomplete.vim
" =============================================================
" 補完を有効に
let g:neocomplete#enable_at_startup=1
" 補完をスキップ
let g:neocomplete#skip_auto_completion_time=""

" =============================================================
"  vim-marching
" =============================================================
" 非同期でなく同期処理で補完
let g:marching_backend="sync_clang_command"
" clangのオプション
let g:marching_clang_command_option="-std=c++1y"
" neocomplete.vimと併用して，自動補完
let g:marching_enable_neocomplete=1
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns={}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
	\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" =============================================================
"  caw.vim
" =============================================================
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除，複数行も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)
" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)

" =============================================================
"  vim-quickhl
" =============================================================
" <Space>m でカーソル下の単語，もしくは選択した範囲のハイライト
" 再度 <Space>m でハイライトを解除
" <Space>Mで全ハイライトを解除
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
