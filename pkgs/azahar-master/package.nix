{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2127.0-alpha1-unstable-2026-10-10";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "5f3306d13cab40bbd5cf38f2cf3ae8b6e6eedca6";
      hash = "sha256-aXQf2TiIGDfKmKLVXcilFSG7zAxwdpnxb45v/SGAtLY=";
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
