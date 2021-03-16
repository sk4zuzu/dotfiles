{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        neovim mc htop groff
        zip unzip
        bash_5 bc which
        curl ncat
        git stow

        python3.8
        python38Packages.virtualenv

        docker_compose

        awscli2 aws-iam-authenticator
      ];
    };
  };
}
