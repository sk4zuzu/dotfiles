{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        neovim mc htop
        groff lynx pandoc
        zip unzip
        bash_5 bc which
        curl ncat jq

        stow
        gitAndTools.git
        gitAndTools.pre-commit

        python38Packages.ansible
        python38Packages.pip
        python38Packages.pyopenssl
        python38Packages.python

        docker_compose

        awscli aws-iam-authenticator
      ];
    };
  };
}
