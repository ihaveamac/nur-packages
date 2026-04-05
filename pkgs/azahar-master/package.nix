{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0.1-unstable-2026-04-05";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "ba6f8cb744e59deaaaefbb46b532b405b09112ac";
    hash = "sha256-K4NPkRotoKpuZ084ggtp4zDQSUHoDZE+K3KNNNZ6o9I=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
