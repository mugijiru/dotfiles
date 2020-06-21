# 環境判定
## Linux(Ubuntu)
if [ `uname` = "Linux" ]; then
  alias ls='ls -FG --color=auto'
  alias pcsuspend='sudo pm-suspend --quirk-s3-bios --quirk-s3-mode; xlock'
fi

## Mac OS X
if [ `uname` = "Darwin" ]; then
  alias ls='ls -FG'
  alias top='top -o cpu'
  alias nethack='jnethack'
  alias mysql='mysql5'

  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
  export EC2_HOME=/usr/local/ec2-api-tools
  export AWS_ELB_HOME=/usr/local/ElasticLoadBalancing
  export PATH=$PATH:$JAVA_HOME/bin:$EC2_HOME/bin:$AWS_ELB_HOME/bin

  if [[ -s ~/.private.zshrc ]] ; then
    source ~/.private.zshrc
  fi
fi


# ENV
export LANG=ja_JP.UTF-8
export HGENCODING=utf-8

# PROMPT
PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)
%# '

# RPROMPT(ブランチ名を表示するとか)
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=100000000

# 除外パターンなどを使えるようにする
setopt extended_glob

# git show HEAD^ とか rake foo[bar] で glob 扱いで使えなくならないようにする
setopt no_nomatch

# 履歴ファイルに時刻を記録
setopt extended_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# 補完時にヒストリを自動的に展開する。
setopt hist_expand

# shell間でhistoryの共有
setopt share_history

# 直前と重複したcommandを保存しない
setopt hist_ignore_dups

# cdコマンドなしでcdする
setopt auto_cd

# cd で自動的に pushd する
setopt auto_pushd

# 重複した dir を push しない
setopt pushd_ignore_dups

# コマンド名をミスった時に「ほんとにええのんか?」って聞いてくる
setopt correct

# Emacs 風のキーバインドにする
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# 補完時に色設定。正直、この設定で何が変わってるのかわかってない
zstyle ':completion:*' list-colors ''


# URLの文字列を自動的にescape
autoload -Uz url-quote-magic

# clipboardから貼り付けた時もescape
zle -N self-insert url-quote-magic

# emacs(ansi-term) で zsh が使えるように
[[ $TERM = "eterm-color" ]] && TERM=xterm-color

# Macの日本語ファイル名(濁点など)対策に
setopt combining_chars


# aliases
## pipe系
alias -g L='| lv -c'
alias -g H='| head'
alias -g T='| tail -F'
alias -g G='| grep'

## 短縮系
alias vi='vim'
alias ll='ls -l'
alias less='less -N'
alias grep='grep --color'
alias ..='cd ..'
alias cless='grep -v -e "-^$" -e "^[ \t]*#"' # 空行とコメント行を抜いて見るため
alias mplayer='mplayer -fs'
if [ -x "$(command -v peco)" ]; then
    alias ss='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|sort|uniq|peco|awk "{print \$2}")'
fi


## typo対策
alias l='ls'
alias s='ls'
alias ks='ls'
alias snv='svn'
alias c='cd'
alias cd..='cd ..'


export PATH=~/bin:$PATH
