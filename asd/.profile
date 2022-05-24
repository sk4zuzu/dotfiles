#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.utf8'
export LC_CTYPE='C'
export EDITOR='nvim'

export PIP_PREFIX="$HOME/.local"
export PYTHONPATH="$PIP_PREFIX/lib/python3.9/site-packages:$PYTHONPATH"
export PATH="$HOME/.local/share/gem/ruby/2.7.0/bin:$PIP_PREFIX/bin:$PATH"

export ANSIBLE_LIBRARY="$HOME/.ansible/plugins/modules:/usr/share/ansible/plugins/modules:$HOME/.ansible/roles/paluh.augeas/library:$ANSIBLE_LIBRARY"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/_git/sk4zuzu-nix/asd-flk/result:$PATH"

export KUBECONFIG="$HOME/.kube/k3s.yaml:$HOME/.kube/config:$KUBECONFIG"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
