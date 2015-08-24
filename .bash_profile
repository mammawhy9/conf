# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't aike systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# user speCific aliases and functions
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
 
bldblk='\e[1;30m' k - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
 
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
 
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias rld='source ~/.bash_profile'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias find='find / | grep'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias grep='grep --color=auto'
alias clr='clear'
alias rmf='rm -rf'
# refresh shell
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
		if [ ! "${BRANCH}" == "" ]
				then
							STAT=`parse_git_dirty`
									echo "[${BRANCH}${STAT}]"
										else
													echo ""
														fi
													}

													# get current status of git repo
													function parse_git_dirty {
														status=`git status 2>&1 | tee`
															dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
																untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
																	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
																		newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
																			renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
																				deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
																					bits=''
																						if [ "${renamed}" == "0" ]; then
																									bits=">${bits}"
																										fi
																											if [ "${ahead}" == "0" ]; then
																														bits="*${bits}"
																															fi
																																if [ "${newfile}" == "0" ]; then
																																			bits="+${bits}"
																																				fi
																																					if [ "${untracked}" == "0" ]; then
																																								bits="?${bits}"
																																									fi
																																										if [ "${deleted}" == "0" ]; then
																																													bits="x${bits}"
																																														fi
																																															if [ "${dirty}" == "0" ]; then
																																																		bits="!${bits}"
																																																			fi
																																																				if [ ! "${bits}" == "" ]; then
																																																							echo " ${bits}"
																																																								else
																																																											echo ""
																																																												fi
																																																											}

																																																											export PS1="\[\e[31m\]\u\[\e[m\]\[\e[32m\]\w\[\e[m\]\[\e[31m\]\`parse_git_branch\`\[\e[m\]\[\e[33m\]\d\[\e[m\]\[\e[35m\]\A\[\e[m\]\[\e[32m\]>\[\e[m\] "

