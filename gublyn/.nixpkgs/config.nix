{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop
        zip unzip
        bash which
        curl jq
        git stow

        python3
        python3Packages.pip
        python3Packages.virtualenv

        docker_compose
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
