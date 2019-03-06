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

## === Alias ===

alias ll='ls -la'

## === Keybinding ===

bindkey '^R' peco-history-selection

## === Other ===

# cdした後で自動的にlsする
function chpwd() { ls -1 }

# 環境変数の適用
if [ -e ~/.bash_profile ]; then
  source ~/.bash_profile
fi

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
