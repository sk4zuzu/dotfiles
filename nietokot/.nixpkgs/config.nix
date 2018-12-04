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
        docker_compose
        vscode
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
