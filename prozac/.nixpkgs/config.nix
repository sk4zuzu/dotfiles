{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop groff
        zip unzip
        bash_5 gnumake which
        curl jq
        git stow
        feh

        vscode
        rustup clang lldb

        php73
        php73Packages.composer

        python3
        python37Packages.virtualenv

        nodejs-10_x

        postgresql_11 mysql57

        docker_compose vagrant

        google-cloud-sdk
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
