{ lib, stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2126.0-alpha2-unstable-2026-06-24";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "93143bcb15fd4074e31a7cacbcd85f5129180544";
    hash = "sha256-6TAw1i1oQN/zzw9/53BPyjrmxvTlMY1RXCfDBXhsvY4=";
    fetchSubmodules = true;
  };

  # remove unnecessary patch
  # TODO: remove this removal once nixpkgs has caught up
  patches = [];

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
    platforms = lib.platforms.aarch64 ++ lib.platforms.x86_64;
    # empty output
    broken = stdenv.isDarwin;
  };
})
