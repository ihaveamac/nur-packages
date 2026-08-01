{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc5-unstable-2026-07-31";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "ccb1e6274eb4db65f76496d6c4c21b2707eaa4b2";
      hash = "sha256-CpZJz5DyWlpT9Sd7VmjqcYbJNQd3MTxijC/lNvIr+WU=";
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
