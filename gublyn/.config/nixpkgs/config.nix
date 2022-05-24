{
  allowUnfree = true;
  packageOverrides = pkgs: {
    asd = with pkgs;
      let
      in buildEnv {
        name = "asd";
        paths = [
          cdrkit
          docker_compose
          gnumake
          rustup lldb clang
        ];
      };
  };
}
