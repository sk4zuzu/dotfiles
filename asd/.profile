#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'
export EDITOR='nvim'

export VIRTUAL_ENV_DISABLE_PROMPT=1

export PATH="$HOME/_git/sk4zuzu-nix/helm-flk/result:$PATH"
export PATH="$HOME/_git/sk4zuzu-nix/kops-flk/result:$PATH"
export PATH="$HOME/_git/sk4zuzu-nix/kubectl-flk/result:$PATH"
export PATH="$HOME/_git/sk4zuzu-nix/terraform-flk/result:$PATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
