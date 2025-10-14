##########
# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
##########



# activate starship
eval "$(starship init zsh)"

# シェル関数`compinit`の自動読み込み
# NOTE: 起動を速くするなら `compinit -C` でキャッシュ活用を検討
autoload -Uz compinit && compinit -C

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
# NOTE: 検索体験向上のため `share_history`, `hist_ignore_space`, `hist_reduce_blanks` 等も候補。
# NOTE: `HISTSIZE` が `SAVEHIST` より小さい設計の意図を要確認。

# alias setting
source ~/.alias_profile

##
# setting: '^E'=peco-cdr
##
# NOTE: `peco + cdr` は `zoxide` + `fzf` への置換で軽量・高速化の余地あり
# cdr command
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
# peco for cdr command
function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9].//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr


# activate mise
eval "$(~/.local/bin/mise activate zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nogawa.narumi/Developer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nogawa.narumi/Developer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nogawa.narumi/Developer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nogawa.narumi/Developer/google-cloud-sdk/completion.zsh.inc'; fi



##########
# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
##########
