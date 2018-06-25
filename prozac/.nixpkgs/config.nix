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
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
