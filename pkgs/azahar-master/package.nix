{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0-rc1-unstable-2026-03-13";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "100b00b3b569a24e8a27ed692c39d6961a12ae8c";
    hash = "sha256-smFw/a7kcYjMiThNrF9o6fub4PfzV1ibM/XiltwULag=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
