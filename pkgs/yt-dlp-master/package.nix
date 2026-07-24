{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.07.04-unstable-2026-07-23";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "fdcc954df4955267ec1627cbeb347b661a110e7c";
      hash = "sha256-JavzrPx/UWFAnnkxmNDUCfBJnhsJC2coelqqUBumPk8=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
