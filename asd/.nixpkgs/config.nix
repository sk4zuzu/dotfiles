{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop groff
        zip unzip
        bash_5 bc which
        curl ncat
        git git-lfs stow
        jq

        nethogs iftop

        gnumake pkg-config

        vscode
        go gcc
        python3
        python37Packages.virtualenv

        nodejs-10_x

        docker_compose

        cdrkit cloud-utils

        aws-iam-authenticator
      ];
    };
  };
}
# vim:ts=2:sw=2:et:syn=nix:
