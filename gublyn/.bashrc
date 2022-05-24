#!/usr/bin/env sh

export PS1='\u:\w\$ '

alias hrep='history|grep'
alias mc='LC_CTYPE=en_US.utf8 mc'
alias root='doas -s'
alias vim='nvim'
alias g='git'

SSH_AGENT_PID=`pgrep -u ${USER} ssh-agent`

if [ -n "${SSH_AGENT_PID}" ]; then
    export SSH_AGENT_PID
    export SSH_AUTH_SOCK="${HOME}/.ssh/.agent"
else
    rm -f ${HOME}/.ssh/.agent
    eval `ssh-agent -a ${HOME}/.ssh/.agent`
    for KEY in `ls -1 ${HOME}/.ssh/id_* | grep -v '\.pub$'`; do
        ssh-add $KEY
    done
    unset KEY
fi
