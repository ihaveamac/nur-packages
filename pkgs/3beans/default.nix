{ lib, gccStdenv, fetchFromGitHub, pkg-config, wxGTK32, portaudio, libGL }:

let
  stdenv = gccStdenv;
in
stdenv.mkDerivation rec {
  name = "3beans";
  version = "0-unstable-2025-02-05";

  src = fetchFromGitHub {
    owner = "Hydr8gon";
    repo = "3Beans";
    rev = "f65d0fa078f561050b3a76ac8771f676e8ec2022";
    hash = "sha256-RzJSZJhYjYxT07TzqKIRUqda7ExAKqGPSoqhg8aKiOw=";
  };

  buildInputs = [ wxGTK32 portaudio libGL ];
  nativeBuildInputs = [ pkg-config ];

  makeFlags = [ "DESTDIR=${placeholder "out"}" ];

  meta = with lib; {
    license = licenses.gpl3;
    description = "A low-level 3DS emulator (maybe)";
    homepage = "https://github.com/Hydr8gon/3Beans";
    platforms = platforms.all;
    broken = stdenv.isDarwin;
    mainProgram = "3beans";
  };
}
