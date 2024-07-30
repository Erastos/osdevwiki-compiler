let
  pkgs = import <nixpkgs> {};
  prefix = "";
  target = "i686-elf";
  path = "";
in 
pkgs.stdenvNoCC.mkDerivation rec {
  name = "binutils-osdevwiki";
  src = pkgs.fetchzip {
    url = "https://ftp.gnu.org/gnu/binutils/binutils-2.41.tar.xz";
    hash = "sha256-8dGjwSZTk28XKXwkODNezqFVLXDA6Ycf/dLF+RoYGWo=";
  };

  preConfigure = ''
    mkdir build
    cd build
  '';

  configureScript = "../configure";

  configureFlags = [
    "--target=${target}"
    "--with-sysroot"
    "--disable-nls"
    "--disable-werror"
  ];
  
  nativeBuildInputs = [
    pkgs.libgcc
    pkgs.gcc
    pkgs.gnumake
    pkgs.bison
    pkgs.flex
    pkgs.gmp
    pkgs.libmpc
    pkgs.mpfr
    pkgs.texinfo
    pkgs.isl
    pkgs.perl
  ];
  
  checkPhase = ''
    make test
  '';

}
