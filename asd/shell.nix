with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "shell";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    gcc pkgconfig
    libffi openssl
  ];
}

# vim:ts=2:sw=2:et:syn=nix:
