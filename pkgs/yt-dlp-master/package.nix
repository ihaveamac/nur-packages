{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (final: prev: {
  version = "2026.06.09-unstable-2026-06-30";

  src = fetchFromGitHub {
    owner = "yt-dlp";
    repo = "yt-dlp";
    rev = "e584a65f2a0feee0c6c363b3309e9ebd6065f6b4";
    hash = "sha256-TyNijtU1pnnEAYC58wpvpL/F2wuMgG/I5N+Ao4sXxM8=";
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
  };
})
