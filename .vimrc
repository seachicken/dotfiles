" vi互換はせずvimのデフォルト設定を使用
if &compatible
  set nocompatible
endif

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

call dein#begin(s:dein_dir)

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

" プラグインを非同期でインストールする為、先にインストールする
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif

" プラグインのインストール
if dein#check_install()
  call dein#install()
endif
" ======================

" シンタックスハイライト
:syntax on

" 行番号の表示
set number

" カラースキーマの指定
colorscheme desert
