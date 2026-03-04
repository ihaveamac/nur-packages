{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-alpha4-unstable-2026-03-03";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "93e831decbe545fbd40a6b310ec56b13a69f00f1";
    hash = "sha256-YAdJO+LyI3cC9DCyl8IxygdGPry2IHThXFkxGZKb/lo=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
