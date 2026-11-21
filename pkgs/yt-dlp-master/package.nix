{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.10.26-unstable-2026-11-21";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "28b379d666051e795cbb663adac85179d5ce81f7";
      hash = "sha256-4hcU/mxIbrYh4FUBaj0tX2wyg5mXn+2ppzEdOao1JBY=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
