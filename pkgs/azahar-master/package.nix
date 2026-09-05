{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.1-rc3-unstable-2026-09-04";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "ac95f6f69db8f1971c0040df868219e9ccd12211";
      hash = "sha256-cu3dBD++zYYCr58asAFC8URvG0IUUApsFv+dJywuGzQ=";
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
