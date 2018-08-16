## === zsh options ===

## 補完機能の強化
autoload -U compinit
compinit

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## === Prompt ===

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '%F{green}[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{yellow}[%b|%a]%f'

RPROMPT=""
RPROMPT+='%F{green}%~%f'
RPROMPT+='${vcs_info_msg_0_}'

## === Other ===

# cdした後で自動的にlsする
function chpwd() { ls -1 }

# 環境変数の適用
source ~/.bash_profile
