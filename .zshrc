# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify hist_ignore_space
setopt auto_pushd

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# フロー制御を無効
setopt no_flow_control

# emacsvi風なキーバインド
bindkey -e

# コマンド履歴のインクリメント検索 ctrl-rで履歴検索したあと ctrl-rで次候補、ctrl-sで前候補
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# ctrl-pでコマンド入力の途中でコマンド履歴を検索する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# ctlr+wで/までを区切り文字として単語を削除する
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
autoload -Uz compinit
compinit
zstyle :compinstall filename '/Users/masa/.zshrc'

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

  
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


zstyle ':completion:*:default' menu select=1

# パイプラインでgrepを渡す
alias -g G='| grep'

# パイプラインでlessを渡す
alias -g L='| less'

# alias fo git
alias -g gp='git push -u origin master'


# End of lines added by compinstall

PROMPT='[%n@%m]'
RPROMPT='[%F{green}%d%f]'

if which rbenv > /dev/null; then
   export RBENV_ROOT="${HOME}/.rbenv"
   export PATH=${RBENV_ROOT}/shims:${PATH}
   eval "$(rbenv init -)";
fi

# set GOPATH
export GOPATH=$HOME/_go

# gim
function gim() {
    vim `git ls-files | peco`
    }

# sでsshをリストから選択して実行する
alias s='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco|awk "{print \$2}")'


