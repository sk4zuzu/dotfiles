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

        vscode
        go gcc gnumake protobuf

        python2
        python27Packages.pip
        python27Packages.virtualenv

        docker_compose
        kubectl kubernetes-helm
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
