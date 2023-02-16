" vi互換はせずvimのデフォルト設定を使用
if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" === dein settings ===
" 参照パスの設定 
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" 自動インストール
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" プラグインのインストール
if dein#check_install()
  call dein#install()
endif
" ======================

" バックアップ(.swp）不要 
set noswapfile

" アンドゥの永続化
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
  call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

" yankをクリップボードにもコピー
set clipboard=unnamed

" マウス操作を有効化
set mouse=a
set ttymouse=sgr

" :e でファイル名を補完する
set wildmenu
set wildmode=list:longest,full

" ステータスラインの表示
set laststatus=2

" シンタックスハイライト
syntax on

" 検索
set hlsearch
nnoremap <esc><esc> :silent! nohls<cr>
set incsearch

" 行番号の表示
set number

" インデントの設定 
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236 
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black 

" コード補完
let g:ycm_autoclose_preview_window_after_insertion = 1

" Lispの設定
let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait > /dev/null 2> /dev/null &"
let g:slimv_lisp = 'ros run'
let g:slimv_impl = 'sbcl'
