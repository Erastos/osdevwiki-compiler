let
  pkgs = import <nixpkgs> {};
  prefix = "";
  target = "i686-elf";
  path = "";
in 
pkgs.stdenvNoCC.mkDerivation rec {
  name = "gcc-osdevwiki-shell";
  nativeBuildInputs = [
    (import ./binutils.nix)
    (import ./gcc.nix)
  ];

}
