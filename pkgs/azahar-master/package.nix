{ lib, stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2126.0-alpha2-unstable-2026-06-29";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "7c225c6abb9802f81dccb1ea8e32d1c05a63a538";
    hash = "sha256-2QYjeYfIfYXipfp2SCODnmRttr4NAlteod+/Lb4on7Y=";
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
