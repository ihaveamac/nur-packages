{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-alpha4-unstable-2026-03-07";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "ced1ec0112f115429d3349c394c89cdbf3fe6ed9";
    hash = "sha256-+yHHrzLfbiC7nc+4WvmLnO+rLfsc1UTwL4CKs+pxGVo=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
