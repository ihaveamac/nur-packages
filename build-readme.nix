{ pkgs ? import <nixpkgs> {} }:

with builtins;
let
  lib = pkgs.lib;
  nurAttrs = import ./default.nix { inherit pkgs; };
  isAlias = n: n == "3dstool" || n == "3dslink";
  isReserved = n: n == "lib" || n == "overlays" || n == "modules" || n == "hmModules";
  isDerivation = p: isAttrs p && p ? type && p.type == "derivation";

  nameValuePair = n: v: { name = n; value = v; };

  nurAttrsFiltered = 
    listToAttrs
      (map (n: nameValuePair n nurAttrs.${n})
        (filter (n: (!isReserved n) && (!isAlias n))
          (attrNames nurAttrs)));
in
pkgs.writeText "README.md" ''
# nur-packages

![Build and populate cache](https://github.com/ihaveamac/nur-packages/workflows/Build%20and%20populate%20cache/badge.svg) [![Cachix Cache](https://img.shields.io/badge/cachix-ihaveahax-blue.svg)](https://ihaveahax.cachix.org)

My personal [NUR](https://github.com/nix-community/NUR) repository.

Darwin/macOS builds are manually pushed by me to cachix occasionally. Usually when I also update flake.lock.

NUR link: https://nur.nix-community.org/repos/ihaveamac/

## Packages

| Name | Attr | Description |
| --- | --- | --- |
${lib.concatStringsSep "\n" (lib.mapAttrsToList (k: v: "| ${if (v.meta ? homepage) then "[${v.name}](${v.meta.homepage})" else v.name} | ${replaceStrings [ "_" ] [ "\\_" ] k} | ${v.meta.description} |") nurAttrsFiltered)}

## Home Manager modules

### services.lnshot.enable

Enables the lnshot daemon to automatically link Steam screenshots.

### services.lnshot.picturesName

Name of the directory to manage inside the Pictures folder. Defaults to "Steam Screenshots".
''