{
  lib,
  stdenv,
  azahar,
  fetchFromGitHub,
}:

azahar.overrideAttrs (
  final: prev: {
    pname = "azahar";
    version = "2126.0-rc5-unstable-2026-08-07";
    src = fetchFromGitHub {
      owner = "azahar-emu";
      repo = "azahar";
      rev = "53946252536ceb055e89775952e6aec56452ae79";
      hash = "sha256-lnbYzbKuaYqXsWbl2C3PWosGval8uPgfDQQED/RIKlg=";
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
