#!/usr/bin/env sh

if [ -f "${HOME}/_git/sk4zuzu-nix/asd-flk/result/kube-ps1.sh" ]; then
    source "${HOME}/_git/sk4zuzu-nix/asd-flk/result/kube-ps1.sh"
    export PS1='$(kube_ps1) \u:\w\$ '
else
    export PS1='\u:\w\$ '
fi

alias hrep='history|grep'
alias mc='LC_CTYPE=en_US.utf8 mc'
alias root='doas -s'
alias vim='nvim'

alias g='git'

alias dc='docker-compose'
alias kc='kubectl'
alias tf='terraform'
alias tg='terragrunt'

alias get='kubectl get'
alias des='kubectl describe'

alias vm='kubectl get vm'
alias pod='kubectl get pod'
alias svc='kubectl get svc'
alias ing='kubectl get ing'
alias all='kubectl get all'
alias pvc='kubectl get pvc,pv'
alias sec='kubectl get secret'
alias log='kubectl logs -f'

function netshoot {
    kubectl run tmp-netshoot-$(openssl rand -hex 2) \
        --rm -i --tty --image nicolaka/netshoot -- /bin/bash
}

function netshoot_host {
    kubectl run tmp-netshoot-$(openssl rand -hex 2) \
        --rm -i --tty --overrides='{"spec": {"hostNetwork": true}}' --image nicolaka/netshoot -- /bin/bash
}

function a {
    local -r sk='sk --ansi'
    local -r rg='rg --color=always'
    $sk --interactive \
        --cmd "if [[ -n '{}' ]]; then $rg --line-number {}; $rg --files | $sk --exact --filter {}; else $rg --files; fi" \
        --delimiter ":" \
        --bind "enter:execute(if [[ -n '{2}' ]]; then nvim {1} +{2}; else nvim {1}; fi)"
}

function h {
    eval `bat $HOME/.bash_history | sk --ansi`
}

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
