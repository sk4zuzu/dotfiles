#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'
export EDITOR='nvim'

export PIP_PREFIX="$HOME/.local"
export PYTHONPATH="$PIP_PREFIX/lib/python3.8/site-packages:$PYTHONPATH"
export PATH="$PIP_PREFIX/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/_git/sk4zuzu-nix/asd-flk/result:$PATH"

export KUBECONFIG="$HOME/.kube/k3s.yaml:$HOME/.kube/config:$KUBECONFIG"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
