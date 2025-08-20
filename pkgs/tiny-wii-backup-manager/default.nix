{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "TinyWiiBackupManager";
  version = "1.3.5";

  src = fetchFromGitHub {
    owner = "mq1";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-QotZTl2q4aabrYTBsU21Fi5NWNBW7SzzeBi3olRh/Js=";
  };

  cargoHash = "sha256-SWKASbtDAgK72Ocodyy6YjGnUrfIHFvBHx/aSgWIDmY=";

  meta = with lib; {
    description = "Tool for decrypting all mogg files used by the Rock Band series";
    homepage = "https://github.com/mq1/TinyWiiBackupManager";
    license = licenses.gpl2Only;
    platforms = platforms.all;
    mainProgram = "tiny-wii-backup-manager";
  };
}
