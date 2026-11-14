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
    version = "2127.0-rc3-unstable-2026-11-12";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "11eceda5e0e682a1f44e396bf954a1b9137097ca";
      hash = "sha256-zXxM3hORSNb2lATw7dd60837rtMq6EqYKHvtZ6r3mM0=";
      fetchSubmodules = true;
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
    };
  }
)
