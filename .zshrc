# 環境判定
## Linux(Ubuntu)
if [ `uname` = "Linux" ]; then
  alias gemdir='cd /usr/lib/ruby/gems/1.8/gems/; pwd'
  alias ls='ls -FG --color=auto'
  alias pcsuspend='sudo pm-suspend --quirk-s3-bios --quirk-s3-mode; xlock'
fi

## Mac OS X
if [ `uname` = "Darwin" ]; then
  alias ls='ls -FG'
  alias top='top -o cpu'
  alias netbeans='open /Applications/NetBeans/NetBeans\ 6.5.app'
  alias gemdir='cd /opt/local/lib/ruby/gems/1.8/gems/; pwd'
  alias nethack='jnethack'
  alias mysql='mysql5'
  alias macvim='open /Applications/MacPorts/MacVim.app'

  export OPT_BINDIR='/opt/local/bin'
  export SVN_EDITOR='$OPT_BINDIR/vi'
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
  export EC2_HOME=/usr/local/ec2-api-tools
  export AWS_ELB_HOME=/usr/local/ElasticLoadBalancing
  export PATH=$PATH:$JAVA_HOME/bin:$EC2_HOME/bin:$AWS_ELB_HOME/bin


  if [[ -s ~/.private.zshrc ]] ; then
    source ~/.private.zshrc
  fi

  if [[ -s ~/.rvm/scripts/rvm ]] ; then
    source ~/.rvm/scripts/rvm
  fi
fi


# ENV
export LANG=ja_JP.UTF-8
export HGENCODING=utf-8

# PROMPT
PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)%# '

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

setopt autocd extendedglob

# ri なんかで怒られないように
setopt nonomatch

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
setopt correct

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"


autoload -Uz compinit
compinit
# End of lines added by compinstall

# TAB関係
zstyle ':completion:*' list-colors ''


# URLの文字列を自動的にescape
autoload -Uz url-quote-magic

# clipboardから貼り付けた時もescape
zle -N self-insert url-quote-magic

# emacs で zsh が使えるように
[[ $TERM = "eterm-color" ]] && TERM=xterm-color


# aliases
##便利系
alias todo='echo $1 >> ~/TODO.txt'
alias tcat='cat ~/TODO.txt'
alias tdel='rm ~/TODO.txt'
alias ted='vi ~/TODO.txt'
alias tless='less ~/TODO.txt'
alias cuke='cucumber'

## pipe系
alias -g L='| lv -c'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
#alias -g W='| wc'
alias -g S='| sed'
#alias -g A='| awk'


## 短縮系
alias vi='vim'
alias ll='ls -l'
alias less='less -N'
alias grep='grep --color'
alias ..='cd ..'
alias cless='grep -v -e "-^$" -e "^[ \t]*#"'
alias wl='wc -l'
alias mplayer='mplayer -fs'


## typo対策
alias l='ls'
alias s='ls'
alias ks='ls'
alias snv='svn'
alias c='cd'
alias cd..='cd ..'

# add original program path
#export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=~/bin:$PATH


#export AUTOFEATURE=true

