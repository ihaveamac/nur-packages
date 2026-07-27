{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc4-unstable-2026-07-26";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "ff1d9d2985cc6a6402762011a115571fd95aef50";
      hash = "sha256-V+Pyp/uk6W1NTTVkv1rgmAx2Mqo6fdp5CZnF5Md09bs=";
      fetchSubmodules = true;
    };

    # remove unnecessary patch
    # TODO: remove this removal once nixpkgs has caught up
    patches = [ ];

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
      # empty output
      broken = stdenv.isDarwin;
    };
  }
)
