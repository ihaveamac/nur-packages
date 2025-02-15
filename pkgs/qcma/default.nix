{ lib, pkgs, stdenv, fetchFromGitHub, git, qmake, wrapQtAppsHook, pkg-config, ffmpeg_4, libnotify, qtbase }:

let
  vitamtp = pkgs.callPackage ./vitamtp.nix {};
in
stdenv.mkDerivation rec {
  pname = "qcma";
  version = "0.4.2";

  src = fetchFromGitHub {
    owner = "codestation";
    repo = pname;
    rev = "65f0eab8ca0640447d2e84cdc5fadc66d2c07efb";
    hash = "sha256-qfxMpUsNECjuwTQwqK2PaJHMnNrIkEHJv95PgH7I2y8=";
    leaveDotGit = true;
  };

  buildInputs = [ vitamtp ffmpeg_4 libnotify qtbase ];
  nativeBuildInputs = [ git qmake wrapQtAppsHook pkg-config ];

  meta = with lib; {
    description = "[BROKEN] Cross-platform content manager assistant for the PS Vita";
    homepage = "https://codestation.github.io/qcma/";
    license = licenses.gpl3;
    platforms = platforms.unix;
    broken = true;
  };
}
