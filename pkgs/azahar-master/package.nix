{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.1-rc2-unstable-2026-08-30";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "c07f2cc96d657522f8042dc31a676997f63994d1";
      hash = "sha256-v784hfTCJfGSdUs/mKJGDmDjGROUKbBIil2U3Bb1mR8=";
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
