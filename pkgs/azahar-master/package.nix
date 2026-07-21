{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc3-unstable-2026-07-21";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "c711b0ab324d2ec116292b0db7c04a5733b8e559";
      hash = "sha256-rw38kAGQjQCLd8lk97VnZRXgenEGA0/zVRV9fb6CFvw=";
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
