{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-unstable-2026-08-10";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "321840218e18091a1e20fafccb15ad47ed628c58";
      hash = "sha256-sZPIjJ0M/ef5gKEZSn0V5Gb/bWGdQOJi0Q3jR8OJWsw=";
      fetchSubmodules = true;
    };

    # remove unnecessary patch
    # TODO: remove this removal once nixpkgs has caught up
    patches = [ ];

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
      platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
      # empty output
      broken = stdenv.isDarwin;
    };
  }
)
