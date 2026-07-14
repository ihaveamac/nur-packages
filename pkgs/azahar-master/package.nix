{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc2-unstable-2026-07-13";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "dfb4b89e07e7bd3f2acf212781915e432adf14d1";
      hash = "sha256-D9QPWPPTZR6RHP91dToGVKo1HllEC8lViac/XPpYBe8=";
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
