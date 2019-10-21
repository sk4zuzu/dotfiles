
HELM_VERSION                          ?= 2.14.3
KUBECTL_VERSION                       ?= 1.14.3
PACKER_VERSION                        ?= 1.4.1
TERRAFORM_VERSION                     ?= 0.12.3
TERRAFORM_PROVIDER_ACME_VERSION       ?= 1.3.5
TERRAFORM_PROVIDER_GOOGLE_VERSION     ?= 2.9.1
TERRAFORM_PROVIDER_HELM_VERSION       ?= 0.10.1
TERRAFORM_PROVIDER_KUBERNETES_VERSION ?= 1.8.1
TERRAFORM_PROVIDER_LOCAL_VERSION      ?= 1.3.0
TERRAFORM_PROVIDER_NULL_VERSION       ?= 2.1.2
TERRAFORM_PROVIDER_OVH_VERSION        ?= 0.5.0
TERRAFORM_PROVIDER_RANDOM_VERSION     ?= 2.1.2
TERRAFORM_PROVIDER_TEMPLATE_VERSION   ?= 2.1.2
TERRAFORM_PROVIDER_TERRAFORM_VERSION  ?= 1.0.2
TERRAFORM_PROVIDER_TLS_VERSION        ?= 2.0.1
TERRAGRUNT_VERSION                    ?= 0.19.7

TARGETS = \
$(GOPATH)/bin/helm \
$(GOPATH)/bin/kubectl \
$(GOPATH)/bin/packer \
$(GOPATH)/bin/terraform \
$(GOPATH)/bin/terraform-provider-acme \
$(GOPATH)/bin/terraform-provider-google \
$(GOPATH)/bin/terraform-provider-helm \
$(GOPATH)/bin/terraform-provider-kubernetes \
$(GOPATH)/bin/terraform-provider-local \
$(GOPATH)/bin/terraform-provider-null \
$(GOPATH)/bin/terraform-provider-ovh \
$(GOPATH)/bin/terraform-provider-random \
$(GOPATH)/bin/terraform-provider-template \
$(GOPATH)/bin/terraform-provider-terraform \
$(GOPATH)/bin/terraform-provider-tls \
$(GOPATH)/bin/terragrunt

define hashicorp_release_install
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	curl -fSL https://releases.hashicorp.com/$(1)/$(2)/$(1)_$(2)_linux_amd64.zip \
	| zcat >$$@ \
	&& chmod +x $$@
endef

define helm_release_install
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	curl -fSL https://get.helm.sh/$(1)-v$(2)-linux-amd64.tar.gz \
	| tar -xz -f- --strip-components=1 -C /tmp/ linux-amd64/$(1) \
	&& mv -f /tmp/$(1) $$@ \
	&& chmod +x $$@
endef

define kubernetes_release_install
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	curl -fSL https://storage.googleapis.com/kubernetes-release/release/v$(2)/bin/linux/amd64/$(1) \
	     -o $$@ \
	&& chmod +x $$@
endef

define terragrunt_release_install
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	curl -fSL https://github.com/gruntwork-io/$(1)/releases/download/v$(2)/$(1)_linux_amd64 \
	     -o $$@ \
	&& chmod +x $$@
endef

PIP_REQUIREMENTS = \
ansible \
autopep8 \
fabric \
mypy \
netaddr \
ovh \
pipenv \
pygments \
pygments-json \
pylint \
pylint-runner \
python-vagrant \
tavern \
watchdog

NPM_REQUIREMENTS = \
yarn \
react-scripts

export

.PHONY: all nix pip npm clean

all: nix $(TARGETS) pip npm

pip: nix
	nix-shell --run \
	"unset SOURCE_DATE_EPOCH && pip3 --no-cache-dir install $(PIP_REQUIREMENTS)"

npm: nix
	npm install -g npm && npm install -g $(NPM_REQUIREMENTS)

nix:
	nix-env -i local

clean:
	rm -f $(TARGETS)

$(eval \
	$(call helm_release_install,helm,$(HELM_VERSION)))

$(eval \
	$(call kubernetes_release_install,kubectl,$(KUBECTL_VERSION)))

$(eval \
	$(call hashicorp_release_install,packer,$(PACKER_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform,$(TERRAFORM_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-acme,$(TERRAFORM_PROVIDER_ACME_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-google,$(TERRAFORM_PROVIDER_GOOGLE_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-helm,$(TERRAFORM_PROVIDER_HELM_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-kubernetes,$(TERRAFORM_PROVIDER_KUBERNETES_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-local,$(TERRAFORM_PROVIDER_LOCAL_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-null,$(TERRAFORM_PROVIDER_NULL_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-ovh,$(TERRAFORM_PROVIDER_OVH_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-random,$(TERRAFORM_PROVIDER_RANDOM_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-template,$(TERRAFORM_PROVIDER_TEMPLATE_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-terraform,$(TERRAFORM_PROVIDER_TERRAFORM_VERSION)))

$(eval \
	$(call hashicorp_release_install,terraform-provider-tls,$(TERRAFORM_PROVIDER_TLS_VERSION)))

$(eval \
	$(call terragrunt_release_install,terragrunt,$(TERRAGRUNT_VERSION)))

# vim:ts=4:sw=4:noet:syn=make:
