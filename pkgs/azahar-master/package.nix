{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.1.2-unstable-2026-09-26";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "955ef51a27f2e2c3de340ec0f972407aef955eca";
      hash = "sha256-fLncJXXYQTl6lvGMHdkBenROJ+qjrHmDH3rhRwz6QHk=";
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
