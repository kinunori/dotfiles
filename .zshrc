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

# lsの結果に色をつける
case "${OSTYPE}" in
darwin*)
 # Mac
 alias ls="ls -GF"
;;
linux*)
 # Linux
 alias ls='ls -F --color'
;;
esac

# End of lines added by compinstall

PROMPT='[%n@%m]'
RPROMPT='[%F{green}%d%f]'

# rbenv初期化
if which rbenv > /dev/null; then
#   export RBENV_ROOT="${HOME}/.rbenv"
#   export PATH=${RBENV_ROOT}/shims:${PATH}
   eval "$(rbenv init - zsh)";
fi

# set GOPATH
export GOPATH=$HOME/_go

# gim
function gim() {
    vim `git ls-files | peco`
    }

# sでsshをリストから選択して実行する
alias s='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco|awk "{print \$2}")'

#export PYTHONPATH=/usr/local/lib/python3.4/site-packages/

# 115200でUSBシリアルで接続する
alias -g serial-115200='screen /dev/cu.usbserial 115200'
alias -g serial-9600='screen /dev/cu.usbserial 9600'
### Added by the Heroku Toolbelt and Hashicorp Packer
export PATH="/usr/local/heroku/bin:/opt/packer:/Users/masa/_go/bin:$PATH"


# pyenv初期化
if [ -d $HOME/.pyenv ]; then
#  export PATH="${HOME}/.pyenv/shims:$PATH"
  eval "$(pyenv init -)"
fi

# title と書いておけば、cdしたときにlsが実行されるのに加えて
# タブのtitleとして
# [一個上のディレクトリ名]/[現在のディレクトリ名]
# が表示されて、複数のtabで行き来する場合に「どのtabがどのディレクトリで作業してるか」把握しやすい

function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# topを起動している間tabの色が黄緑っぽくなる。

alias top='tab-color 134 200 0; top; tab-reset'


#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:

# コマンド補完用 コマンド + スペースでそのあとのオプションなども補完できる
# /usr/local/share/zsh-completions配下に補完用のファイルがある
# 外部からの補完用ファイルを追加することも可能
# 例：curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > \
#     /usr/local/share/zsh-completions/_docker

if [ -e /usr/local/share/zsh-completions ]; then
   fpath=(/usr/local/share/zsh-completions $fpath)
fi

# node_modules
export NODE_PATH=/usr/local/lib/node_modules

# aws cli の自動補完
source /usr/local/share/zsh/site-functions/_aws

# pyenvによるbrew doctor実行時のwarningを削除する
# http://www.task-notes.com/entry/20141223/1419324649
alias brew="env PATH=${PATH/\/Users\/masa\/\.pyenv\/shims:/} brew"

