{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.1-unstable-2026-04-14";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "afbaf8e485d004e855f14c7063cadb3233f4e308";
    hash = "sha256-2Z4ICpxQrMaohz1gGAU1nhaua1AAgCQouZOjGOmBaBk=";
    fetchSubmodules = true;
  };

  # remove unnecessary patch
  # TODO: remove this removal once nixpkgs has caught up
  patches = [];

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
