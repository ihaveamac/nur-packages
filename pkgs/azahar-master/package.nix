{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2127.0-alpha3-unstable-2026-10-17";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "987f18405073960622e1043bb44005989135c6e1";
      hash = "sha256-SLIyzqcrm4QPncInCJEtQnen1C0Ipb/V+tY9m6PfU6s=";
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
