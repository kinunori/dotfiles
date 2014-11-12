# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify hist_ignore_space

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# vi風なキーバインド
bindkey -e

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

# End of lines added by compinstall

PROMPT='[%n@%m]'
RPROMPT='[%F{green}%d%f]'

if which rbenv > /dev/null; then
   export RBENV_ROOT="${HOME}/.rbenv"
   export PATH=${RBENV_ROOT}/shims:${PATH}
   eval "$(rbenv init -)";
fi

export GOPATH=$HOME/_go

function gim() {
    vim `git ls-files | peco`
    }

alias s='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco|awk "{print \$2}")'

