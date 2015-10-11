# colors
NM="\[\033[0;38m\]"
HI="\[\033[0;37m\]"
HII="\[\033[0;36m\]"
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export PS1="$NM[ $HI\u $SI\w$NM ] $IN"

# yay bash history!
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"

# `alias`
alias cd..="cd .."
alias ls..="ls .."
alias ls='ls -GFh'
alias ll='ls -AlGFh'
alias c='clear'
alias 6='perl6 -e'

alias svnc='svn commit -m'
alias svnr='svn revert'
alias e='emacs'
alias cca='gcc *.c -W -Wall -ansi -pedantic -Werror'
alias ccob='cobc -W -x'

md () { mkdir -p "$@" && cd "$@"; }
mdc () { mkdir -p "$@" && cd "$@" && e "$@.c"; }
mdp () { mkdir -p "$@" && cd "$@" && e "$@.php"; }
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=~/homebrew/bin/:/Users/ven/os/perl6/rakudo/install/bin:/Applications/Racket\ v6.0.1/bin:~/os/perl6/panda/bin:/usr/local/gnat/bin/:/Applications/Dyalog-14.1.app/Contents/Resources/Dyalog/:$PATH
HOMEBREW_CACHE=~/Library/Caches/Homebrew

export GOPATH=~/os/go/

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


export PYTHONPATH=./
export PERL6LIB=lib
