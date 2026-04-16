{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.1-unstable-2026-04-16";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "d4b5633cf0212ad8d347e012e10b4d5ef0bcd3f1";
    hash = "sha256-QSHpC/KXtsAj29to4GWhJKwy/rsk3FvnHko77wCtMd4=";
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
