{ lib, stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2126.0-alpha2-unstable-2026-07-01";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "384913be70da65dd9505c433dcdcadf02d495d4f";
    hash = "sha256-nezOaTPoExWuFoanXPt8EJ1LwhcwGRLf8nDr9J4pllY=";
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
