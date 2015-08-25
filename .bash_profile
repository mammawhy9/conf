# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

txtrst='\e[0m'    # Text Reset
parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias find='find / | grep'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias grep='grep --color=auto'
alias clr='clear'
alias cls='clear'
alias rmf='rm -rf'
export PS1="\[\e[31m\]\u\[\e[m\] \[\e[32m\]\w\[\e[m\]\[\e[31m\]\`parse_git_branch\`\[\e[m\] \[\e[33m\]\d\[\e[m\] \[\e[35m\]\A\[\e[m\] \[\e[36m\]\h\[\e[m\]\n\[\e[32m\]>\[\e[m\] "
export PS2="\[\e[31m\]>> $txtrst"
set LANG='pl_PL.utf8'
set LC_ALL='pl_PL.utf8'
set HISTCONTROL='erasedups'
set HISTSIZE='10000'
set EDITOR='vim'
