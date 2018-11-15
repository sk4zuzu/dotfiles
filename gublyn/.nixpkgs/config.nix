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

        python2
        python27Packages.pip
        python27Packages.virtualenv

        docker_compose
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
