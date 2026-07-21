{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.07.04-unstable-2026-07-21";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "aaf7405ba3a45b32c59f160426efc9b561af035a";
      hash = "sha256-WN5Isq68jWX+SS3qnYiv96+7bes3eWVtmiPEOpP+Afc=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
