{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  wxwidgets_3_3,
  portaudio,
  libGL,
  libepoxy,
}:

stdenv.mkDerivation rec {
  pname = "noods";
  version = "release-unstable-2026-07-30";

  src = fetchFromGitHub {
    owner = "Hydr8gon";
    repo = "NooDS";
    rev = "ed484216ad8b26f3c26b19436b605124a80e29d7";
    hash = "sha256-lrhl3ZxerA8Cd2jD/XIQZz9+cssBFgwrBqEW+zTFWGM=";
  };

  buildInputs = [
    wxwidgets_3_3
    portaudio
    libGL
    #libepoxy
  ];
  nativeBuildInputs = [ pkg-config ];

  postPatch = ''
    substituteInPlace Makefile \
      --replace-fail g++ "\$(CXX)"
  '';

  installPhase = ''
    mkdir -p $out/bin
  ''
  + (
    if stdenv.isDarwin then
      ''
        contents=$out/Applications/NooDS.app/Contents
        mkdir -p $contents/{MacOS,Resources}
        cp Info.plist $contents
        cp noods $contents/MacOS/NooDS
        cp icon/icon-mac.icns $contents/Resources/NooDS.icns
        ln -s $contents/MacOS/NooDS $out/bin/noods
      ''
    else
      ''
        mkdir -p $out/share/applications $out/share/icons/hicolor/64x64/apps
        cp noods $out/bin
        cp com.hydra.noods.desktop $out/share/applications
        cp icon/icon-linux.png $out/share/icons/hicolor/64x64/apps/com.hydra.threebeans.png
      ''
  );

  meta = with lib; {
    description = "A (hopefully!) speedy DS emulator";
    homepage = "https://github.com/Hydr8gon/NooDS";
    license = licenses.gpl3;
    platforms = platforms.all;
    mainProgram = "noods";
  };
}
