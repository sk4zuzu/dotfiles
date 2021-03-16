{
  allowUnfree = true;
  packageOverrides = pkgs: {
    local = with pkgs;
      let
        python-pkgs = python-pkgs: with python-pkgs; [
          pysdl2
        ];
        python3-with-pkgs = python3.withPackages python-pkgs;
      in buildEnv {
        name = "local";
        paths = [
          neovim mc htop
          zip unzip
          bash_5 which
          curl jq
          git stow
          cdrkit
          docker_compose
          gnumake
          rustup lldb clang
          python3-with-pkgs
        ];
      };
  };
}
