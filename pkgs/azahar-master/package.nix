{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc3-unstable-2026-07-15";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "d81195bdc57decba46a465b63267cb2032e21e4a";
      hash = "sha256-vQeQN9DsFb61I7cOU9zWyRSMwMPph+ogv1gaTbwD69w=";
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
