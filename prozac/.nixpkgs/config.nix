{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop groff
        zip unzip
        bash which
        curl jq
        git stow

        vscode gnumake

        php71
        php71Packages.box
        php71Packages.composer

        python3
        python37Packages.virtualenv

        nodejs-10_x

        docker_compose packer vagrant

        google-cloud-sdk
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
