{ stdenvNoCC, fetchzip, lib }:

stdenvNoCC.mkDerivation rec {
  pname = "homebox-bin";
  version = "0.12.1";

  src = passthru.sources.${stdenvNoCC.hostPlatform.system}
    or (throw "Unsupported system: ${stdenvNoCC.hostPlatform.system}");

  passthru = {
    sources = rec {
      x86_64-linux = fetchzip {
        url = "https://github.com/sysadminsmedia/homebox/releases/download/v${version}/homebox_Linux_x86_64.tar.gz";
        sha256 = "sha256-NUMUHw3Mi5v8hJuXRP6QQm/wU8p7wN9s1ImRBGwpVqo=";
      };
      i686-linux = fetchzip {
        url = "https://github.com/sysadminsmedia/homebox/releases/download/v${version}/homebox_Linux_i386.tar.gz";
        sha256 = "sha256-trpR7ukihsippS3DsW9blkXx3s9Y3XHqSw3X5iF3s/g=";
      };
      aarch64-linux = fetchzip {
        url = "https://github.com/sysadminsmedia/homebox/releases/download/v${version}/homebox_Linux_arm64.tar.gz";
        sha256 = "sha256-lmKbUQYw9IPa32Ol/xUDXHyEk+7MbwJVMwsRf2ZUDnE=";
      };
      armv6l-linux = fetchzip {
        url = "https://github.com/sysadminsmedia/homebox/releases/download/v${version}/homebox_Linux_armv6.tar.gz";
        sha256 = "sha256-dYIJqB+48QQM9lTwhDmW7yhngG5YF9hpLhDVysVYZZQ=";
      };
      armv7l-linux = armv6l-linux;
      x86_64-darwin = fetchzip {
        url = "https://github.com/sysadminsmedia/homebox/releases/download/v${version}/homebox_Darwin_x86_64.tar.gz";
        sha256 = "sha256-lxpYFqNmRussLYB+mNLiIiKIr0Wsatk93IzsSr3TDbA=";
      };
      aarch64-darwin = fetchzip {
        url = "https://github.com/sysadminsmedia/homebox/releases/download/v${version}/homebox_Darwin_arm64.tar.gz";
        sha256 = "sha256-ITWbj1tZKFF3KiCtitCM9xiRMh/iAj2rUME0oAkg3WM=";
      };
    };
  };

  installPhase = ''
    mkdir -p $out/bin
    cp homebox $out/bin
  '';
}
