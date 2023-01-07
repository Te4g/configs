# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

###### BASH HISTORY ######
HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=4000
HISTTIMEFORMAT="%F %T "
###### BASH HISTORY ######

###### PROMPT ######
PS1="\[\e[0;37m\]#\#\[\e[0;m\] \[\e[0;36m\][\t]\[\e[0;m\] \[\e[0;32m\]\u@\h\[\e[0;m\]: \[\e[1;34m\]\w\[\e[0;m\] \[\e[0;35m\] \n\\$\[\e[0;m\] "
###### PROMPT ######

##### FUNCTIONS #####
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' can not be extract by ex()" ;;
    esac
  else
    echo "'$1' invalid file"
  fi
}
##### FUNCTIONS #####

#### ALIAS COMMANDE SYS ####
alias ls="ls --color"
alias grep="grep --color"
alias ll="ls -la"
alias lh="ls -lh"
alias la="ls -a"
alias igrep="grep -i"
#### ALIAS COMMANDE SYS ####


##### ALIAS NETWORK ######
alias net="nmap -v -Pn -A"
##### ALIAS NETWORK ######


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
 
