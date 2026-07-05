{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (final: prev: {
  version = "2026.07.04-unstable-2026-07-04";

  src = fetchFromGitHub {
    owner = "yt-dlp";
    repo = "yt-dlp";
    rev = "fdec00e0bf530dc6c3cc7b1dd780e95d9ae460e9";
    hash = "sha256-+oHcVylLXFJTRR6jXF6IXvgntXJz0tRdtnwTruRPkoc=";
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
  };
})
