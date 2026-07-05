{ lib, stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2126.0-alpha2-unstable-2026-07-04";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "ad0dde0725256c54cdd321c2d03492c7e2930a97";
    hash = "sha256-lUzcRJZWTX38BHVD2b3pajIZNuRTYvMIRHChyIao0lg=";
    fetchSubmodules = true;
  };

  # remove unnecessary patch
  # TODO: remove this removal once nixpkgs has caught up
  patches = [];

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
    # empty output
    broken = stdenv.isDarwin;
  };
})
