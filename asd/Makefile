
HELM_VERSION                          ?= 2.13.1
KUBECTL_VERSION                       ?= 1.13.1
PACKER_VERSION                        ?= 1.4.5
TERRAFORM_VERSION                     ?= 0.12.13
TERRAFORM_PROVIDER_HELM_VERSION       ?= 0.10.4
TERRAFORM_PROVIDER_KUBERNETES_VERSION ?= 1.9.0
TERRAFORM_PROVIDER_LOCAL_VERSION      ?= 1.4.0
TERRAFORM_PROVIDER_NULL_VERSION       ?= 2.1.2
TERRAFORM_PROVIDER_RANDOM_VERSION     ?= 2.2.1
TERRAFORM_PROVIDER_TEMPLATE_VERSION   ?= 2.1.2
TERRAFORM_PROVIDER_TLS_VERSION        ?= 2.1.1
TERRAGRUNT_VERSION                    ?= 0.21.4

TARGETS = \
$(GOPATH)/bin/helm \
$(GOPATH)/bin/kubectl \
$(GOPATH)/bin/packer \
$(GOPATH)/bin/terraform \
$(GOPATH)/bin/terraform-provider-helm \
$(GOPATH)/bin/terraform-provider-kubernetes \
$(GOPATH)/bin/terraform-provider-local \
$(GOPATH)/bin/terraform-provider-null \
$(GOPATH)/bin/terraform-provider-random \
$(GOPATH)/bin/terraform-provider-template \
$(GOPATH)/bin/terraform-provider-tls \
$(GOPATH)/bin/terragrunt

define HASHICORP_RELEASE_INSTALL
.PHONY: $(GOPATH)/bin/$(1)
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	mkdir -p /tmp/$(1)-$(2)/ \
	&& curl -fSL https://releases.hashicorp.com/$(1)/$(2)/$(1)_$(2)_linux_amd64.zip \
	        -o /tmp/$(1)-$(2)/download.zip \
	&& unzip -o -d /tmp/$(1)-$(2)/ /tmp/$(1)-$(2)/download.zip \
	&& mv /tmp/$(1)-$(2)/$(1)* $$@ \
	&& rm -rf /tmp/$(1)-$(2)/ \
	&& chmod +x $$@
endef

define HELM_RELEASE_INSTALL
.PHONY: $(GOPATH)/bin/$(1)
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	curl -fSL https://get.helm.sh/$(1)-v$(2)-linux-amd64.tar.gz \
	| tar -xz -f- --strip-components=1 -C /tmp/ linux-amd64/$(1) \
	&& mv -f /tmp/$(1) $$@ \
	&& chmod +x $$@
endef

define KUBERNETES_RELEASE_INSTALL
.PHONY: $(GOPATH)/bin/$(1)
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	curl -fSL https://storage.googleapis.com/kubernetes-release/release/v$(2)/bin/linux/amd64/$(1) \
	     -o $$@ \
	&& chmod +x $$@
endef

define TERRAGRUNT_RELEASE_INSTALL
.PHONY: $(GOPATH)/bin/$(1)
$(GOPATH)/bin/$(1): $(GOPATH)/bin/$(1)-$(2)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(1)-$(2):
	curl -fSL https://github.com/gruntwork-io/$(1)/releases/download/v$(2)/$(1)_linux_amd64 \
	     -o $$@ \
	&& chmod +x $$@
endef

PIP_REQUIREMENTS = \
ansible \
pipenv

NPM_REQUIREMENTS = \
yarn

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
	$(call HELM_RELEASE_INSTALL,helm,$(HELM_VERSION)))

$(eval \
	$(call KUBERNETES_RELEASE_INSTALL,kubectl,$(KUBECTL_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,packer,$(PACKER_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform,$(TERRAFORM_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform-provider-helm,$(TERRAFORM_PROVIDER_HELM_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform-provider-kubernetes,$(TERRAFORM_PROVIDER_KUBERNETES_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform-provider-local,$(TERRAFORM_PROVIDER_LOCAL_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform-provider-null,$(TERRAFORM_PROVIDER_NULL_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform-provider-random,$(TERRAFORM_PROVIDER_RANDOM_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform-provider-template,$(TERRAFORM_PROVIDER_TEMPLATE_VERSION)))

$(eval \
	$(call HASHICORP_RELEASE_INSTALL,terraform-provider-tls,$(TERRAFORM_PROVIDER_TLS_VERSION)))

$(eval \
	$(call TERRAGRUNT_RELEASE_INSTALL,terragrunt,$(TERRAGRUNT_VERSION)))

# vim:ts=4:sw=4:noet:syn=make:
