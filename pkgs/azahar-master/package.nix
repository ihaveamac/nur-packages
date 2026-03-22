{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-rc4-unstable-2026-03-21";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "2c8297c34c1add84a85607c9a4f2f5340e4f544e";
    hash = "sha256-Sae6T6wIYWaTmh5UhBOrGRMkmP/baITS1/wGRxyO+qw=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
