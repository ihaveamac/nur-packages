{ lib, stdenv, azahar, fetchFromGitHub }:

azahar.overrideAttrs (final: prev: {
  pname = "azahar";
  version = "2126.0-alpha2-unstable-2026-07-10";
  src = fetchFromGitHub {
    owner = "azahar-emu";
    repo = "azahar";
    rev = "38e6e79024d9ff3bc05fda850c0a927832337916";
    hash = "sha256-vf4rXHeh2G86D43asf52awbpLbR0ckIS0DGx0mrHZSo=";
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
