{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop groff
        zip unzip
        bash_5 which
        curl ncat
        git stow

        gnumake pkg-config

        vscode
        go
        python3
        python37Packages.virtualenv

        nodejs-10_x

        docker_compose

        cdrkit cloud-utils
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
