{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.0.1-unstable-2026-03-29";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "3066887ff4cf9f89e626047d0f142ad231053cf1";
    hash = "sha256-xfFwMcxWjED9gVrejXcNIMYQdfG3qwKWUoL80bRrdCg=";
    fetchSubmodules = true;
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
