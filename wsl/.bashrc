#!/usr/bin/env bash

if [ -f "$HOME/.local/bin/kube-ps1.sh" ]; then
    source "$HOME/.local/bin/kube-ps1.sh"
    export PS1='$(kube_ps1) \u:\w\$ '
else
    export PS1='\u:\w\$ '
fi

alias hrep='history|grep'
alias root='sudo -i'
alias vim='nvim'

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
alias log='kubectl logs -f'

function netshoot {
    kubectl run "tmp-netshoot-$(openssl rand -hex 2)" \
        --rm -i --tty --image nicolaka/netshoot -- /bin/bash
}

function netshoot_host {
    kubectl run "tmp-netshoot-$(openssl rand -hex 2)" \
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
    eval "$(bat "$HOME/.bash_history" | sk --ansi)"
}

function sec {
    local -r secret="$1"
    if [[ -n "$secret" ]]; then
        kubectl get secret "$secret" -ojson | jq -r '.data|map_values(@base64d)'
    else
        kubectl get secrets
    fi
}

SSH_AGENT_PID=$(pgrep -u "$USER" ssh-agent)

if [ -n "$SSH_AGENT_PID" ]; then
    export SSH_AGENT_PID
    export SSH_AUTH_SOCK="$HOME/.ssh/.agent"
else
    rm -f "$HOME/.ssh/.agent"
    eval "$(ssh-agent -a "$HOME/.ssh/.agent")"
    for KEY in $(ls -1 "$HOME"/.ssh/id_* | grep -v '\.pub$'); do
        ssh-add "$KEY"
    done
    unset KEY
fi

export PATH=/home/asd/.pgo/database:$PATH
export PGOUSER=/home/asd/.pgo/database/pgouser
export PGO_CA_CERT=/home/asd/.pgo/database/client.crt
export PGO_CLIENT_CERT=/home/asd/.pgo/database/client.crt
export PGO_CLIENT_KEY=/home/asd/.pgo/database/client.key
export PGO_APISERVER_URL=https://127.0.0.1:8443
export PGO_NAMESPACE=database
export PGO_OPERATOR_NAMESPACE=database
