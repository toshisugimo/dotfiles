"保存時の文字コード
set fileencoding=utf-8

"読み込み時の文字コードの自動判別、左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932

"改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac

"□や○文字が崩れる問題を解決
set ambiwidth=double

"インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch

"検索パターンに大文字小文字を区別しない
set ignorecase

"検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase

"検索結果をハイライト
set hlsearch

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" シンタックスハイライトを有効にする
syntax on

" インサートモードでバックスペースを有効にする
set backspace=indent,eol,start

" 折り畳み文字を有効化
set foldmethod=marker

" インデント
set autoindent
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2

" 行数表示
set number

"カーソルラインをハイライト
set cursorline

" 行の端までいっても折り返さない
set nowrap

" クリップボードの有効化
" だけどclipboard有効状態でコンパイルできていないので意味がない！
set clipboard+=unnamed

" 横にスクロールする際の移動量
set sidescroll=1

" Vimの外部で変更されたことが判明したとき、自動的に読み直す
set autoread

" 索対象をハイライトする
set hlsearch

" インクリメント検索
set incsearch

" 大文字と小文字を区別しない
set ignorecase

" 大文字が含まれる場合のみ大文字小文字を区別する。
set smartcase

" 置換時、同一行に対象の文字列があれば置換を行う
set gdefault

" マウスの有効化
set mouse=a

" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

" 常にタブラインを表示
set showtabline=2

" スクロールが始まるまでの残り行数を設定
set scrolloff=10

" swapファイルを作成しない
set noswapfile

" ファイル保存時に行末の不要な空白を取り除く
augroup DeleteTailSpace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END

"Ctrl+eでNERDTreeを開く
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"vim-easy-align設定
vmap <Enter> <Plug>(EasyAlign)

"vim-airline設定
"let g:airline_powerline_fonts = 1
"set laststatus=2
set laststatus=2
set showtabline=2 " 常にタブラインを表示
set t_Co=256 " この設定がないと色が正しく表示されない
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

" ==================================================
" 全角スペースをハイライト表示
" ==================================================
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


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

"ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

"変数宣言の=とかを揃えてくれる
NeoBundle 'junegunn/vim-easy-align'

"補完(閉じタグとか)を勝手にやってくれる
NeoBundle 'jiangmiao/auto-pairs'

"16進数カラーコードやRGB指定をハイライト
NeoBundle 'lilydjwg/colorizer'

"ファイルに変更が加わった際にNEADtreeのツリーに変更を示すアイコンを表示
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

"ファイルに変更が加わった際に、Vimの行番号のところに「+」や「-」といった差分情報を表示
NeoBundle 'airblade/vim-gitgutter'

"ステータスバーやタブバーをカスタマイズ
NeoBundle 'vim-airline/vim-airline'

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on
