{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.1.2-unstable-2026-10-03";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "86a9f9236ae42bb5a2b995dbc933d599d8ea07ac";
      hash = "sha256-4h7wsPdaTVK7tRkosB/i5ZAJ7uB4RN+TvCf+H7l0gT8=";
      fetchSubmodules = true;
    };

    # remove unnecessary patch
    # TODO: remove this removal once nixpkgs has caught up
    patches = [ ];

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
      # empty output
      broken = stdenv.hostPlatform.isDarwin;
    };
  }
)
