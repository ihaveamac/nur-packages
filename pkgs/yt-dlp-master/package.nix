{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (final: prev: {
  version = "2026.06.09-unstable-2026-07-01";

  src = fetchFromGitHub {
    owner = "yt-dlp";
    repo = "yt-dlp";
    rev = "16bdcc525e6a550781d65d6fed92a37800ad95e1";
    hash = "sha256-Z3V/p/DDdI0qVOwU0FAmOCphibxjAWuVpceR+xwuqkI=";
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
  };
})
