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
    version = "2127.0-rc5-unstable-2026-11-21";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "6f293a24daa292bd02b4ffee1a2adb5435e1ae00";
      hash = "sha256-6rfBlTI2bWcipzf8KrOXr4Qoee2VqHgkZuUc7yK1HeQ=";
      fetchSubmodules = true;
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
    };
  }
)
