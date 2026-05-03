{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.1.1-unstable-2026-05-02";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "83eef0012e80336be811d90deef33e95586cffc5";
    hash = "sha256-JyPPcsJC2bh0cp2E0gceLcgNKVy6cHrcvXysT36kR9w=";
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
