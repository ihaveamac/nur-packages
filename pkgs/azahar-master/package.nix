{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.1-unstable-2026-04-17";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "0fe6a8c7dfd1b120fffda1647c0098bba3d55d0b";
    hash = "sha256-Jk5Ke1rIWFFZ78gTvz8wxvUoYDo3ymUVN7FxpR2Mh5E=";
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
