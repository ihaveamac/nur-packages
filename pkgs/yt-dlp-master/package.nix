{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.11.23-unstable-2026-11-23";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "6f73a8d1664a58cdef8c25f01ffb5ab9cf730408";
      hash = "sha256-BpxnzY9GOs9sTv/ZWAwYiiJS7VfaMtp5HHOtXDAGgc0=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
