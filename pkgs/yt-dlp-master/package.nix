{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.10.26-unstable-2026-11-19";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "4adbf698d9a7d79d67a7d11669d04efde3722951";
      hash = "sha256-18HGOUwkhdGuZtHrlHWzp9ST7mPwKQyuzqQgtXAook0=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
