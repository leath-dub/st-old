with import <nixpkgs> {};

stdenv.mkDerivation rec {

  name = "st-leath-dub";
  src = ./.;

  makeFlags = [
    "PKG_CONFIG=${stdenv.cc.targetPrefix}pkg-config"
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
    ncurses
    fontconfig
    freetype
  ];

  buildInputs = with lib; [
    xorg.libX11
    xorg.libXft
    harfbuzz
  ];

  preInstall = ''
    export TERMINFO=$out/share/terminfo
  '';

  installFlags = [ "PREFIX=$(out)" ];
}
