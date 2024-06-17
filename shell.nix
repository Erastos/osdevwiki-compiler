let
  pkgs = import <nixpkgs> {};
  prefix = "";
  target = "i686-elf";
  path = "";
in 
pkgs.stdenv.mkDerivation rec {
  name = "gcc-osdevwiki-shell";
  nativeBuildInputs = [
    pkgs.libgcc
    pkgs.gnumake
    pkgs.bison
    pkgs.flex
    pkgs.gmp
    pkgs.libmpc
    pkgs.mpfr
    pkgs.texinfo
    pkgs.isl
    (import ./binutils.nix)
    (import ./gcc.nix)
  ];

}
