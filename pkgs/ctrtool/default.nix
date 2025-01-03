{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "ctrtool";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "3DSGuy";
    repo = "Project_CTR";
    rev = "ctrtool-v${version}";
    sha256 = "sha256-HqqeQCEUof4EBUhuUAdTruMFgYIoXhtAN3yuWW6tD+Y=";
  };

  preBuild = ''
    cd ctrtool
    make -j$NIX_BUILD_CORES deps CC=${stdenv.cc.targetPrefix}cc CXX=${stdenv.cc.targetPrefix}c++
  '';
  makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" "CXX=${stdenv.cc.targetPrefix}c++" ];
  enableParallelBuilding = true;

  installPhase = ''
    mkdir $out/bin -p
    cp bin/ctrtool $out/bin/
  '';

  meta = with lib; {
    license = licenses.mit;
    description = "A tool to extract data from a 3ds rom";
    homepage = "https://github.com/3DSGuy/Project_CTR";
    platforms = platforms.all;
    mainProgram = "ctrtool";
  };

}
