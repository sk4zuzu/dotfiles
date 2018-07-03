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
        docker_compose
        git stow
        vscode
        go gcc gnumake
        python2
        python27Packages.pip
        python27Packages.virtualenv
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
