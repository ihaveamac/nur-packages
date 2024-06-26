# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  hmModules = import ./hm-modules;

  _3dstool = pkgs.callPackage ./pkgs/3dstool { };
  lnshot = pkgs.callPackage ./pkgs/lnshot { };
  save3ds = pkgs.callPackage ./pkgs/save3ds { };
  cleaninty = pkgs.python3Packages.callPackage ./pkgs/cleaninty { };
  rvthtool = pkgs.callPackage ./pkgs/rvthtool { };
  themethod3 = pkgs.callPackage ./pkgs/themethod3 { };
  makebax = pkgs.callPackage ./pkgs/makebax { };
  ctrtool = pkgs.callPackage ./pkgs/ctrtool { };
  makerom = pkgs.callPackage ./pkgs/makerom { };
  homebox-bin = pkgs.callPackage ./pkgs/homebox-bin { };
  _3dslink = pkgs.callPackage ./pkgs/3dslink { };

  mediawiki_1_39 = pkgs.callPackage ./pkgs/mediawiki {
    version = "1.39.7";
    hash = "sha256-K+gVaBfVxWn9Ylc0KidvkdflMNHA3OETS3vysJ7K5Wk=";
  };
  mediawiki_1_40 = pkgs.callPackage ./pkgs/mediawiki {
    version = "1.40.3";
    hash = "sha256-V+4X7+fVtZ5QV36wfbNQ53RH7WSVYzeFpxDkChTDdjQ=";
  };
  mediawiki_1_41 = pkgs.callPackage ./pkgs/mediawiki {
    version = "1.41.1";
    hash = "sha256-TguqlTuF6U0xBAyyUSCrxgb6hpsuMxJr37t/xhPoxLI=";
  };
  mediawiki_1_42 = pkgs.callPackage ./pkgs/mediawiki {
    version = "1.42.0";
    hash = "sha256-CSo5KYufXUdlPqTGWmlPFz7iR9bTE9O+F3x3mSkYGmc=";
  };

  kwin-move-window = pkgs.callPackage ./pkgs/kwin-move-window { };
  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...

  # compatibility
  "3dstool" = _3dstool;
  "3dslink" = _3dslink;
}
