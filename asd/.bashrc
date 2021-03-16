#!/usr/bin/env sh

if [ -f "${HOME}/_git/sk4zuzu-nix/kubectl-flk/result/kube-ps1.sh" ]; then
    source "${HOME}/_git/sk4zuzu-nix/kubectl-flk/result/kube-ps1.sh"
    export PS1='$(kube_ps1) \u:\w\$ '
else
    export PS1='\u:\w\$ '
fi

alias hrep='history|grep'
alias root='doas -s'
alias vim='nvim'

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

if [ -f "${HOME}/3.8/bin/activate" ]; then
    source "${HOME}/3.8/bin/activate"
fi
