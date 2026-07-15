{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc3-unstable-2026-07-14";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "936c162765955ac36b4b37f326902fdc66cb9dfe";
      hash = "sha256-5Lf+BnKO1XWpEuw6Yqr1zxwp8OfLsK8vherM+/n10nM=";
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
