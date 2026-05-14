{ stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2125.1.1-unstable-2026-05-12";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "778ca369cda984c6bcebfdad876c675cab5f3ed1";
    hash = "sha256-7rls+jh28b4LQp7lF3V+s30K4xrNO1oWnXylZUdOF5E=";
    fetchSubmodules = true;
  };

  # remove unnecessary patch
  # TODO: remove this removal once nixpkgs has caught up
  patches = [];

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    # empty output
    broken = stdenv.isDarwin;
  };
})
