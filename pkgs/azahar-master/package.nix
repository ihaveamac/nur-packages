{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-alpha2-unstable-2026-02-28";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "cb09d1e0644db2a2358325df20d341ae066ab91a";
    hash = "sha256-9vy1TYL2DswnVrHuohxbIdnqrPLvpM+7azpAU8NZ1gw=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
