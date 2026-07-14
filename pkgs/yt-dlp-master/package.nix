{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.07.04-unstable-2026-07-12";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "d9813a3da6959662841dfb34cad0ee6c07a65d1e";
      hash = "sha256-fJVsq9PUjJquprNrBfexbjPgk8yl+GCxMhBHf6365OU=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
