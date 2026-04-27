{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.1.1-unstable-2026-04-26";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "ec6a0dd1c814d0ee22a9feeb73c7de2e530830b4";
    hash = "sha256-otVNbg6ZCWDPErOJBYj3JMyAzx+ZsUsSKOOn54PuB0Y=";
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
