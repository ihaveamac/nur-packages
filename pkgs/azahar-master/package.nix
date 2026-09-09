{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.1-rc5-unstable-2026-09-07";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "073110cb44e2d23e0d893429c264e63e756d4331";
      hash = "sha256-ZVTSSeWHXPgoZO+2b+i1eyj/XEyC8DOFOE4Do3nBfa0=";
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
