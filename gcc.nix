let
  pkgs = import <nixpkgs> {};
  prefix = "";
  target = "i686-elf";
  path = "";
in 
pkgs.stdenvNoCC.mkDerivation rec {
  name = "gcc-osdevwiki";
  src = pkgs.fetchzip {
    url = "https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.gz";
    hash = "sha256-E1b6BTxN9A5kgDycS553DCH+6Ux4xog8CNTFNHPZlwA=";
  };

  preConfigure = ''
    mkdir build
    cd build
  '';

  configureScript = "../configure";

  
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
    (import ./binutils.nix)
  ];

  hardeningDisable = [ "all" ];
  configureFlags = [
    "--target=${target}"
    "--disable-nls"
    "--enable-languages=c,c++"
    "--without-headers"
  ];

  buildPhase = ''
    make all-gcc
    make all-target-libgcc
  '';
  
  installPhase = ''
    make install-gcc
    make install-target-libgcc
  '';
  

}
