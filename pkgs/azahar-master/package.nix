{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc3-unstable-2026-07-18";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "75134fca82eab4e1a86dca0aaa4a188cefff5469";
      hash = "sha256-pDX7mi1UMydHj3hTRXKeLR5tWSQIgrhsEQL/190DDfw=";
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
