{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop
        zip unzip
        bash which jq
        docker_compose
        git stow
        vscode
        rustup
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
