# colors
NM="\[\033[0;38m\]"
HI="\[\033[0;37m\]"
HII="\[\033[0;36m\]"
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"

# `alias`
alias cd..="cd .."
alias ls='ls -GFh'
alias ll='ls -lGFh'
alias c='clear'

alias svnc='svn commit -m'
alias svnr='svn revert'
alias e='emacs'
alias cca='gcc *.c -W -Wall -ansi -pedantic -Werror'

md () { mkdir -p "$@" && cd "$@"; }
mde () { mkdir -p "$@" && cd "$@" && e "$@.c"; }