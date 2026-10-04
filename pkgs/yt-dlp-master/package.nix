{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.08.19-unstable-2026-09-27";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "51bab8a0116f4d8004c315706d809782607d5847";
      hash = "sha256-tvUxhhEUG5PMvQ+EWt3RXze5Ii//52tBUqCBQsBLzHU=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
