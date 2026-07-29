{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc5-unstable-2026-07-28";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "9a2baf0fcbda66df3a6e2f008730f0b993f782eb";
      hash = "sha256-mazQ+LZTS18pfMDi2Vf4zUo8vJqD5cWc0sXIbmNPn6w=";
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
