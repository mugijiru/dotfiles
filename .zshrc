# 環境判定
## Linux(Ubuntu)
if [ `uname` = "Linux" ]; then
  alias gemdir='cd /usr/lib/ruby/gems/1.8/gems/; pwd'
  alias ls='ls -FG --color=auto'
fi

## Mac OS X
if [ `uname` = "Darwin" ]; then
  alias ls='ls -FG'
  alias netbeans='open /Applications/NetBeans/NetBeans\ 6.5.app'
  alias gemdir='cd /opt/local/lib/ruby/gems/1.8/gems/; pwd'
  alias nethack='jnethack'
  alias mysql='mysql5'

  export OPT_BINDIR='/opt/local/bin'
  export SVN_EDITOR='$OPT_BINDIR/vi'
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
  export EC2_HOME=/usr/local/ec2-api-tools
  export AWS_ELB_HOME=/usr/local/ElasticLoadBalancing
  export PATH=$PATH:$JAVA_HOME/bin:$EC2_HOME/bin:$AWS_ELB_HOME/bin

  
  if [[ -s /Users/nuehara/.private.zshrc ]] ; then
    source ~/.private.zshrc
  fi

  if [[ -s /Users/nuehara/.rvm/scripts/rvm ]] ; then
    source /Users/nuehara/.rvm/scripts/rvm
  fi
fi


# ENV
export LANG=ja_JP.UTF-8

# PROMPT
PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)%# '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=100000000

setopt autocd extendedglob

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


# aliases
##便利系
alias todo='echo $1 >> ~/TODO.txt'
alias tcat='cat ~/TODO.txt'
alias tdel='rm ~/TODO.txt'
alias ted='vi ~/TODO.txt'
alias tless='less ~/TODO.txt'
alias pcsuspend='sudo pm-suspend --quirk-s3-bios --quirk-s3-mode; xlock'

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


## typo対策
alias l='ls'
alias s='ls'
alias ks='ls'
alias snv='svn'


alias c='cd'
alias cd..='cd ..'

# add original program path
export PATH=/home/mugijiru/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games


#export AUTOFEATURE=true

