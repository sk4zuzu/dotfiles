HELM_VERSION       ?= 3.3.4
KUBECTL_VERSION    ?= v1.18.6
PACKER_VERSION     ?= 1.6.4
TERRAFORM_VERSION  ?= 0.13.4
TERRAGRUNT_VERSION ?= v0.25.3
YQ_VERSION         ?= 3.4.0

TARGETS = \
$(GOPATH)/bin/helm \
$(GOPATH)/bin/kubectl \
$(GOPATH)/bin/packer \
$(GOPATH)/bin/terraform \
$(GOPATH)/bin/terragrunt \
$(GOPATH)/bin/yq

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
	curl -fSL https://storage.googleapis.com/kubernetes-release/release/$(2)/bin/linux/amd64/$(1) \
	     -o $$@ \
	&& chmod +x $$@
endef

define GITHUB_RELEASE_INSTALL
.PHONY: $(GOPATH)/bin/$(2)
$(GOPATH)/bin/$(2): $(GOPATH)/bin/$(2)-$(3)
	rm -f $$@ && ln -s $$< $$@
$(GOPATH)/bin/$(2)-$(3):
	curl -fSL https://github.com/$(1)/releases/download/$(3)/$(2)_linux_amd64 \
	     -o $$@ \
	&& chmod +x $$@
endef

PIP_REQUIREMENTS = \
ansible \
ansible-lint \
azure-cli \
jsonschema \
netaddr \
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
	$(call GITHUB_RELEASE_INSTALL,gruntwork-io/terragrunt,terragrunt,$(TERRAGRUNT_VERSION)))

$(eval \
	$(call GITHUB_RELEASE_INSTALL,mikefarah/yq,yq,$(YQ_VERSION)))
