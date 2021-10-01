{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        neovim mc htop
        gettext groff lynx pandoc
        zip unzip
        bash_5 dash bc which
        curl ncat jq yq-go

        shellcheck

        stow
        gitAndTools.git
        gitAndTools.pre-commit

        python38Packages.ansible
        python38Packages.pip
        python38Packages.setuptools
        python38Packages.pyopenssl
        python38Packages.python

        docker_compose

        awscli aws-iam-authenticator

        redis postgresql cassandra

        nodejs
      ];
    };
  };
}
