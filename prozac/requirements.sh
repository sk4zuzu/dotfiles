#!/usr/bin/env sh

set -e

[ -z "$__STOP__" ] && nix-env -i local && exec /usr/bin/env __STOP__=1 bash "$0" "$@"

: ${TERRAGRUNT_VERSION:=0.19.7}
: ${PACKER_VERSION:=1.4.2}
: ${TERRAFORM_VERSION:=0.12.3}
: ${TERRAFORM_PROVIDER_NULL_VERSION:=2.1.2}
: ${TERRAFORM_PROVIDER_LOCAL_VERSION:=1.3.0}
: ${TERRAFORM_PROVIDER_TEMPLATE_VERSION:=2.1.2}
: ${TERRAFORM_PROVIDER_TERRAFORM_VERSION:=1.0.2}
: ${TERRAFORM_PROVIDER_GOOGLE_VERSION:=2.9.1}

set -o errexit -o nounset -o pipefail
set -x

install -d -m u=rwx,go= ${GOPATH}/{,bin/}

terragrunt_release_install() {
    local VERSION="$1"; shift

    if [ -x ${GOPATH}/bin/terragrunt ]; then
        return
    fi

    curl -fSL https://github.com/gruntwork-io/terragrunt/releases/download/v${VERSION}/terragrunt_linux_amd64 \
         -o ${GOPATH}/bin/terragrunt \
    && chmod +x ${GOPATH}/bin/terragrunt
}

terragrunt_release_install $TERRAGRUNT_VERSION 

hashicorp_release_install() {
    local NAME="$1"; shift
    local VERSION="$1"; shift

    if [ -x ${GOPATH}/bin/${NAME} ]; then
        return
    fi

    curl -fSL https://releases.hashicorp.com/${NAME}/${VERSION}/${NAME}_${VERSION}_linux_amd64.zip \
    | zcat >${GOPATH}/bin/${NAME} \
    && chmod +x ${GOPATH}/bin/${NAME}
}

hashicorp_release_install packer $PACKER_VERSION
hashicorp_release_install terraform $TERRAFORM_VERSION
hashicorp_release_install terraform-provider-null $TERRAFORM_PROVIDER_NULL_VERSION
hashicorp_release_install terraform-provider-local $TERRAFORM_PROVIDER_LOCAL_VERSION
hashicorp_release_install terraform-provider-template $TERRAFORM_PROVIDER_TEMPLATE_VERSION
hashicorp_release_install terraform-provider-terraform $TERRAFORM_PROVIDER_TERRAFORM_VERSION
hashicorp_release_install terraform-provider-google $TERRAFORM_PROVIDER_GOOGLE_VERSION

pip3_install_requirements_txt() {
    nix-shell --run \
        "unset SOURCE_DATE_EPOCH && pip3 --no-cache-dir install -r $HOME/requirements.txt"
}

pip3_install_requirements_txt

npm_install_requirements() {
    npm install -g npm && npm install -g \
        yarn \
        react-scripts
}

npm_install_requirements

# vim:ts=4:sw=4:et:syn=sh:
