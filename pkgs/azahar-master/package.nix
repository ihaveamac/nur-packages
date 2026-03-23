{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-rc4-unstable-2026-03-22";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "7a600e28d2807fc2b07fe7be7eb84952764bbfd3";
    hash = "sha256-OQgOWcZvJU1Id2mWTUz6Wc2wMesit6+xKZScRfnAHQ8=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
