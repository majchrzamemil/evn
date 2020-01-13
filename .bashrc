if [ "`alias`" = "" ] ; then
  case `uname -n` in
    *sun*)   if [ -f /opt/diax/solaris/etc/diax_bashrc ] ; then
               . /opt/diax/solaris/etc/diax_bashrc
	     fi;;
    *linux*) . /etc/profile;;
  esac
  if [ -f ~./.bash_profile ] ; then
    . .bash_profile
  fi
fi 
if [ -f ~/.alias.bash ] ; then
  . ~/.alias.bash
fi


if [ -f /opt/sge/current/bctgrid/common/settings.sh ] ; then
   . /opt/sge/current/bctgrid/common/settings.sh
fi
TERM=xterm-256color
GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GREEN="\[\033[0;93m\]"
BLUE="\[\033[0;94m\]"
BROWN="\[\033[0;93m\]"
BLACK="\[\033[0;30m\]"
CYAN="\[\033[0;96m\]"
PURPLE="\[\033[0;95m\]"
LIGHT_CYAN="\[\033[1;96m\]"
WHITE="\[\033[1;37m\]"
NO_COLOUR="\[\033[0m\]"

umask 2

PS1="${PURPLE}\n\h:${BLUE}\u-\[\033[31m\]\`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\(\1\)/'\`\[\033[37m\] ${GREEN}\w${NO_COLOUR}\n-> "

#to be updated
export PATH=/home/common/git_configuration/git-review/:$PATH
alias s='grep -i -n -r --color '$'' 

p0() {
    PS1="${PURPLE}\n\h:${CYAN}\u  ${GREEN}\w${NO_COLOUR} \n-> "
}

p1() {
    PS1="\n${GREEN}\w \n${PURPLE}\u@\h ${NO_COLOUR}> "
}
MY_RED="\033[1;91m" 
NO_COLOUR="\[\033[0m\]"
NO_COLOUR2="\033[0m"
printRed(){
    echo -e $MY_RED$1
    echo -n -e $NO_COLOUR2
}

# Autocomplete from history with PgUp / PgDown

alias python="python3"

# GIT SETTINGS
git config --global user.name "Emil Majchrzak"
git config --global merge.tool meld
git config --global diff.tool meld
git config --global color.ui true
git config --global core.editor "vim"

# DIR
alias ls="ls --color"
alias ll="ls -la"
alias fullrebuild='make clean && make -j && make -j runtest && make cppcheck && make doxygen' 
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
