{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.1.2-unstable-2026-10-04";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "6280521bf26ef1393974cd8c898de29cf75f5752";
      hash = "sha256-eBtIasC52+wTaJT+//1nPfyMpcWZ+9F6aYeH/WMLnZ4=";
      fetchSubmodules = true;
    };

    # remove unnecessary patch
    # TODO: remove this removal once nixpkgs has caught up
    patches = [ ];

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
      # empty output
      broken = stdenv.hostPlatform.isDarwin;
    };
  }
)
