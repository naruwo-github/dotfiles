eval "$(starship init zsh)"

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit


##
# zsh history setting
##

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY


# prezto settings
  # about prezto: https://github.com/sorin-ionescu/prezto
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"


# fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf settings
. /opt/homebrew/opt/asdf/asdf.sh

# alias setting
source ~/.alias_profile