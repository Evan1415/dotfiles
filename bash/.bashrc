#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


machine="home"

function elite {
BASHISH_COLOR0=4
BASHISH_COLOR1=1
ESC="\033"
EMBED="\["
UNEMBED="\]"
BASHISH_DA="\342\224\214"
BASHISH_C0="\342\224\224"
BASHISH_C4="\342\224\200"
BASHISH_F9="\342\210\231"
BASHISH_FA="\302\267"
PROMPTSTR="$USER@$HOSTNAME.$machine"
RCS_PS1=""
PS1="${ESC}[3${BASHISH_COLOR1}m${BASHISH_DA}${BASHISH_C4}\
${ESC}[3${BASHISH_COLOR0}m(${ESC}[3${BASHISH_COLOR1}m${PROMPTSTR}${ESC}[3${BASHISH_COLOR0}m)\
${ESC}[3${BASHISH_COLOR1}m-\
${ESC}[3${BASHISH_COLOR0}m(\
${ESC}[3${BASHISH_COLOR1}m\t\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR0}m-:-\
${ESC}[3${BASHISH_COLOR1}m\D{%A %d %B %Y}\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[3${BASHISH_COLOR0}m)\
${ESC}[3${BASHISH_COLOR1}m${BASHISH_C4}${BASHISH_C4}\
${ESC}[3${BASHISH_COLOR0}m]${BASHISH_F9}\
${ESC}[3${BASHISH_COLOR1}m-${BASHISH_F9}${BASHISH_F9}\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_FA}
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${BASHISH_C0}${BASHISH_C4}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}(\
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}\w${RCS_PS1}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED})\
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${BASHISH_C4}${BASHISH_F9}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}${BASHISH_FA}\
${EMBED}${ESC}[0m${UNEMBED}"
}
elite

alias xterm='xterm -sl 1000 -sb -rightbar -ms red -fg yellow -bg black -e /bin/bash'
alias top='top -d 0.4'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -Gp'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
