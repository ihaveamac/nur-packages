{
  fetchFromGitHub,
  yt-dlp,
}:

yt-dlp.overrideAttrs (
  final: prev: {
    version = "2026.07.04-unstable-2026-07-14";

    src = fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "aefce1eea4d0b6bab1ec2bd3beff09bff91a39c8";
      hash = "sha256-k7Hkf9Sexn+zewPfpy0JMJNE+eEx3HC9l0pcEdSTuEU=";
    };

    meta = prev.meta // {
      description = prev.meta.description + " (master branch)";
    };
  }
)
