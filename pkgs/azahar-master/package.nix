{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-unstable-2026-08-11";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "c688076ac96491bd0d390fc8e6d8325fd3fb420f";
      hash = "sha256-vgfwes5vWA45tJCtxpufXNy0pMTSaNO/m3RvV1XLaqs=";
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
