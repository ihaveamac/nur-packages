{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "ytdl-nfo";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "owdevel";
    repo = pname;
    tag = "v${version}";
    hash = "sha256-JVavTteRHdKGx+yZeM8v0MnlYw2RiQcrLswh0N4WNW0=";
  };

  build-system = [ python3Packages.poetry-core ];

  dependencies = with python3Packages; [
    pyyaml
    setuptools_80
  ];

  meta = {
    description = "youtube-dl JSON metadata to Kodi-style NFO converter";
    homepage = "https://github.com/owdevel/ytdl-nfo";
    license = lib.licenses.unlicense;
    platforms = lib.platforms.all;
    mainProgram = "ytdl-nfo";
  };
}
