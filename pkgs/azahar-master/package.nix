{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-alpha4-unstable-2026-03-07";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "70c9e18eea2330869d452fba3d4df0340744a3b1";
    hash = "sha256-McitWaSb4cqOCN+u44ceEtp9zAwsjGSHwFBJElI673s=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
