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
        git stow

        python38Packages.python
        python38Packages.pip

        docker_compose

        aws-iam-authenticator
      ];
    };
  };
}
