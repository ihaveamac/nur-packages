{
  lib,
  stdenv,
  azahar,
  ffmpeg_7-headless,
  fetchFromGitHub,
}:

(azahar.override { ffmpeg_6-headless = ffmpeg_7-headless; }).overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2127.0.1-unstable-2026-11-25";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "c621eafbf316699c55f4c9c0c689d4e49498d360";
      hash = "sha256-1j9XlzdfiJ5US4VWnNnZ2COyqOHM/tmoIClJoaYUu9k=";
      fetchSubmodules = true;
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
    };
  }
)
