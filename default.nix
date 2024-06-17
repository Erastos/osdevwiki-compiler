let
  pkgs = import <nixpkgs> {};
in 
pkgs.stdenv.mkDerivation rec {
  name = "osdevwiki";
  src = [
  (pkgs.fetchzip {
    url = "https://ftp.gnu.org/gnu/binutils/binutils-2.42.tar.xz";
    hash = "sha256-BS7Dn2vTeeZyfTeKjeGF+U3AcP3RChzTncadOugP1mQ=";
  })
  (pkgs.fetchzip {
    url = "https://ftp.gnu.org/gnu/gcc/gcc-14.1.0/gcc-14.1.0.tar.gz";
    hash = "sha256-/aaGZBxiduYI0515y/21Pnyh2WpJx+XVoTm+mb4gFnw=";
  })
  ];
  
  nativeBuildInputs = [
    pkgs.bison
    pkgs.flex
    pkgs.gmp
    pkgs.libmpc
    pkgs.mpfr
    pkgs.texinfo
    pkgs.isl
  ];
  

}
