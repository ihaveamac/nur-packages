{
  lib,
  stdenv,
  fetchzip,
  cmake,
  ninja,
  SDL2,
  SDL2_mixer,
  libpng,
  libjpeg,
  libglvnd,
  git,
  tree
}:

stdenv.mkDerivation rec {
  pname = "thextech";
  version = "1.3.7.3";

  src = fetchzip {
    url = "https://github.com/TheXTech/TheXTech/releases/download/v${version}/thextech-full-src-v${version}.tar.bz2";
    hash = "sha256-8w2H9g3QDRgsRRcMqQjB72tMKQ52J8MMvmqc1Up5G8w=";
  };

  buildInputs = [
    SDL2
    SDL2_mixer
    libpng
    libjpeg
    libglvnd
  ];

  nativeBuildInputs = [
    cmake
    ninja
    git
  ];

  preBuild = ''
    mkdir -p output/lib
    ln -s $PWD/output/lib output/lib64
  '';

  preFixup = ''
    rm -r $out/TheXTech
    mkdir $out/lib
    cp output/lib/*.so* $out/lib
    ${tree}/bin/tree -a $out
  '';
}
