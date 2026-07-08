{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (final: prev: {
  version = "2026.07.04-unstable-2026-07-06";

  src = fetchFromGitHub {
    owner = "yt-dlp";
    repo = "yt-dlp";
    rev = "b3854cc41bc906c905e3b0f7bb39755210acd6d1";
    hash = "sha256-LU6Wp1MIYT/VFpfLeLkW7A/WPVAuAEhx7SEIqrR0okU=";
  };

  meta = prev.meta // {
    description = prev.meta.description + " (master branch)";
  };
})
