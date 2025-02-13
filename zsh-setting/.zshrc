# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.

# activate starship
eval "$(starship init zsh)"

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit

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

# alias setting
source ~/.alias_profile

##
# setting: '^E'=peco-cdr
##
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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/narumi.nogawa/Developer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/narumi.nogawa/Developer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/narumi.nogawa/Developer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/narumi.nogawa/Developer/google-cloud-sdk/completion.zsh.inc'; fi

# activate asdf
export PATH="$HOME/.asdf/shims:$PATH"
source $(brew --prefix asdf)/libexec/asdf.sh

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
