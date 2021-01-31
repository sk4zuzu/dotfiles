{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs; buildEnv {
      name = "local";
      paths = [
        vim mc htop
        zip unzip
        bash_5 which
        curl jq
        git stow
        cdrkit
        docker_compose
        gnumake
        rustup lldb clang
      ];
    };
  };
}
