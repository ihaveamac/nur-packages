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
  version = "release-unstable-2026-08-01";

  src = fetchFromGitHub {
    owner = "Hydr8gon";
    repo = "NooDS";
    rev = "09bec7172ab66f3580536922b09c094a18d157a4";
    hash = "sha256-JUR2bAR2IsVly0crBN2f+Yk5wCmG/gJlbO5+HYNCSSI=";
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
