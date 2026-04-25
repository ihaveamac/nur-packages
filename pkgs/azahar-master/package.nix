{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.1.1-unstable-2026-04-24";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "91128d662504cc3028fc39ef68e4538fb5a6f65e";
    hash = "sha256-B9n2mtrSqcZ5mPUpyf661UUr0FowaBt3V/nAucrtr0M=";
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
