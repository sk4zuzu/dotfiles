{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop groff
        zip unzip
        bash_5 which
        curl jq
        git stow

        gnumake

        python3
        python37Packages.virtualenv

        docker_compose
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
