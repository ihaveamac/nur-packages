{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-alpha4-unstable-2026-03-06";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "2207be30a910dce71d2a16e397683a9cd1303f0f";
    hash = "sha256-N8Mj6j+B0PNPCv/I/j/Myzg2mDgcsNyFJIYbBJDStg8=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
