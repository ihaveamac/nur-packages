{
  lib,
  stdenv,
  stdenvNoCC,
  fetchzip,
  cmake,
  ninja,
  SDL2,
  SDL2_mixer,
  libpng,
  libjpeg,
  libglvnd,
  git,
  tree,
  bashInteractive,
  makeDesktopItem,
  p7zip,
}:

let
  thextech = stdenv.mkDerivation rec {
    pname = "thextech";
    version = "1.3.7.3";

    src = fetchzip {
      url = "https://github.com/TheXTech/TheXTech/releases/download/v${version}/thextech-full-src-v${version}.tar.bz2";
      hash = "sha256-8w2H9g3QDRgsRRcMqQjB72tMKQ52J8MMvmqc1Up5G8w=";
    };

    buildInputs = [
      SDL2
      SDL2_mixer
      libpng
      libjpeg
      libglvnd
    ];

    # this was designed mainly for SMBX, if other packs do something different, it may break
    passthru.wrapGame =
      {
        # examples are in comments
        packId, # smbx
        gameName, # Super Mario Bros. X
        gameDir, # smbx13
        gameSrc, # (the directory to the game assets)
        gameVersion ? version,
        desktopGenericName ? "", # SMBX
        desktopComment ? "", # The Mario fan-game originally created by Andrew Spinks also known as a creator of the Terraria game.
      }:
      let
        executable = "thextech-${packId}";
        wrapperBase = builtins.readFile ./wrapper.sh;
        script =
          builtins.replaceStrings
            [ "NIXBASH" "NIXPACKID" "NIXGAMEDIR" "NIXGAMENAME" "NIXBINARYPATH" ]
            [ "${bashInteractive}/bin/bash" packId "${gameSrc}" gameName "${thextech}/bin/thextech" ]
            wrapperBase;
        desktopItem = makeDesktopItem {
          name = gameName;
          desktopName = executable;
          exec = "${executable} @F";
          icon = gameDir;
          comment = desktopComment;
          genericName = desktopGenericName;
          #encoding = "UTF-8";
          #version = "1.0";
          type = "Application";
          categories = [ "Game" ];
          terminal = false;
          startupWMClass = "TheXTech";
        };
      in
      stdenvNoCC.mkDerivation {
        pname = executable;
        version = gameVersion;

        # TODO: make this support directories
        src = gameSrc;

        nativeBuildInputs = [ p7zip ];

        unpackPhase = ''
          gameDir=$out/games/TheXTech/${gameDir}
          mkdir -p ${gameDir}
          7z x $src -o$gameDir
        '';

        installPhase = ''
          mkdir -p $out/bin $out/share/{applications,icons}
          cp ${desktopItem}/share/applications/*.desktop $out/share/applications

          for f in 16 32 48 128 256; do
            i=$gameDir/graphics/ui/icon/thextech_$f.png
            if test -e $i; then
              d=$out/share/icons/hicolor/''${f}x''${f}/apps
              mkdir -p $d
              cp $i $d/${gameDir}.png
            fi
          done

          cp ${./wrapper.sh} $out/bin/${executable}
          substituteInPlace $out/bin/${executable} \
            --replace-fail NIXBASH ${bashInteractive}/bin/bash \
            --replace-fail NIXPACKID ${packId} \
            --replace-fail NIXGAMEDIR $gameDir \
            --replace-fail NIXGAMENAME "${gameName}" \
            --replace-fail NIXBINARYPATH "${thextech}/bin/thextech"
          chmod +x $out/bin/${executable}
        '';
      };

    nativeBuildInputs = [
      cmake
      ninja
      git
    ];

    preBuild = ''
      mkdir -p output/lib
      ln -s $PWD/output/lib output/lib64
    '';

    preFixup = ''
      rm -r $out/TheXTech
      mkdir $out/lib
      cp output/lib/*.so* $out/lib
      ${tree}/bin/tree -a $out
    '';

    meta = with lib; {
      description = "The full port of the SMBX engine from VB6 into C++ and SDL2, FreeImage and MixerX";
      homepage = "https://wohlsoft.ru/projects/TheXTech/";
      license = licenses.gpl3Plus;
      platforms = platforms.all;
      mainProgram = "thextech";
    };
  };
in
thextech
