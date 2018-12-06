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
        vscode groff
        python36Full
        python36Packages.pip
        python36Packages.virtualenv
        nodejs-8_x
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
