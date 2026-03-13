{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-rc1-unstable-2026-03-12";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "9e162705f49537d927752c962988e7316441db3a";
    hash = "sha256-zjrccu+24R3ScTYmV3rE5edbcA/fQ5fCUsW8c0Oe8sU=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
