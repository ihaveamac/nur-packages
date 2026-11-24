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
    version = "2127.0-unstable-2026-11-23";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "4a147c509571a3d16a06abe679fe1339dbbdbfd7";
      hash = "sha256-26TsPoRSQ9x6z5IL5fDkYEK2uoHkdUAlA/brPrauQiI=";
      fetchSubmodules = true;
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
    };
  }
)
