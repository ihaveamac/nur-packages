{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.1-rc3-unstable-2026-09-06";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "b0d6d9a423f096dbe1ce732dfaa704a75cfdbff7";
      hash = "sha256-gwvDjgaY7LEUNjUSzkRb5o2Vnw4PcYq76lBGP0R52EU=";
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
