{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc3-unstable-2026-07-17";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "79c2f965fe5c1bd6d042e17d396a455546536f2f";
      hash = "sha256-xXYhfjPOfP2JAOiDPrIkEJunX4lAnVorpaE4t1+Q908=";
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
