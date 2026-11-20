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
    version = "2127.0-rc4-unstable-2026-11-18";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "396b4c3c947afd69fada5c4a1270da0d27174e76";
      hash = "sha256-imrSK7iRIqlBTAVh+p8jRx7ruy7WUFa7LKhc6+OUZU8=";
      fetchSubmodules = true;
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
    };
  }
)
