SHELL := $(shell which bash)
SELF  := $(patsubst %/,%,$(dir $(abspath $(firstword $(MAKEFILE_LIST)))))

APT_PKGS := bash coreutils curl gzip htop jq make mc mongodb-clients neovim net-tools \
            python3 python3-pip shellcheck stow tar unzip zip

PIP_PKGS := ansible awscli oci-cli poetry pyyaml==5.4.1

BIN_PKGS := bat fd helm kube-ps1.sh kubectl kubectx kubens packer rg sk terraform

export

.PHONY: all

all:
	@echo apt pip bin

.PHONY: apt

apt:
	sudo apt-get -q update
	sudo apt-get -q install -y $(APT_PKGS)

.PHONY: pip

pip:
	pip3 --no-cache-dir install --ignore-installed setuptools testresources
	pip3 --no-cache-dir install --ignore-installed $(PIP_PKGS)

.PHONY: bin

bin: $(BIN_PKGS:%=$(HOME)/.local/bin/%)

$(HOME)/.local/bin/bat:
	install -d $(dir $@)
	curl -fsSL https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-v0.18.3-x86_64-unknown-linux-musl.tar.gz \
	| tar xzf - --strip-components=1 -C $(dir $@) bat-v0.18.3-x86_64-unknown-linux-musl/bat
	chmod +x $@

$(HOME)/.local/bin/fd:
	install -d $(dir $@)
	curl -fsSL https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-v8.2.1-x86_64-unknown-linux-musl.tar.gz \
	| tar xzf - --strip-components=1 -C $(dir $@) fd-v8.2.1-x86_64-unknown-linux-musl/fd
	chmod +x $@


$(HOME)/.local/bin/helm:
	install -d $(dir $@)
	curl -fsSL https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz \
	| tar xzf - --strip-components=1 -C $(dir $@) linux-amd64/helm
	chmod +x $@

$(HOME)/.local/bin/kube-ps1.sh:
	install -d $(dir $@)
	curl -fsSLo $@ https://raw.githubusercontent.com/jonmosco/kube-ps1/v0.7.0/kube-ps1.sh
	chmod +x $@

$(HOME)/.local/bin/kubectl:
	install -d $(dir $@)
	curl -fsSLo $@ https://storage.googleapis.com/kubernetes-release/release/v1.22.2/bin/linux/amd64/kubectl
	chmod +x $@

$(HOME)/.local/bin/kubectx:
	install -d $(dir $@)
	curl -fsSLo $@ https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubectx
	chmod +x $@

$(HOME)/.local/bin/kubens:
	install -d $(dir $@)
	curl -fsSLo $@ https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubens
	chmod +x $@

$(HOME)/.local/bin/packer:
	install -d $(dir $@)
	curl -fsSLo $@.zip https://releases.hashicorp.com/packer/1.7.2/packer_1.7.2_linux_amd64.zip
	unzip -p $@.zip packer > $@
	chmod +x $@
	rm $@.zip

$(HOME)/.local/bin/rg:
	install -d $(dir $@)
	curl -fsSL https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz \
	| tar xzf - --strip-components=1 -C $(dir $@) ripgrep-13.0.0-x86_64-unknown-linux-musl/rg
	chmod +x $@

$(HOME)/.local/bin/sk:
	install -d $(dir $@)
	curl -fsSL https://github.com/lotabout/skim/releases/download/v0.9.4/skim-v0.9.4-x86_64-unknown-linux-musl.tar.gz \
	| tar xzf - -C $(dir $@) sk
	chmod +x $@

$(HOME)/.local/bin/terraform:
	install -d $(dir $@)
	curl -fsSLo $@.zip https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip
	unzip -p $@.zip terraform > $@
	chmod +x $@
	rm $@.zip
