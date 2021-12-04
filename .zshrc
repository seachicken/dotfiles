# === zsh options ===

# 補完機能の強化
autoload -U compinit
compinit

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# === Prompt ===

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '%F{green}[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{yellow}[%b|%a]%f'
precmd () { vcs_info }

RPROMPT=""
RPROMPT+='%F{green}%~%f'
RPROMPT+='${vcs_info_msg_0_}'

# === Alias ===

alias ll='ls -la'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gg='git log --graph --oneline'

# === Keybinding ===

bindkey '^R' peco-history-selection

# === Plugins ===

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection

# jump
eval "$(jump shell zsh)"

# === Other ===

# 環境変数の適用
if [ -e ~/.bash_profile ]; then
  source ~/.bash_profile
fi
if [ -e ~/.zprofile ]; then
  source ~/.zprofile
fi

# cdした後で自動的にlsする
function chpwd() { ls -1 }
