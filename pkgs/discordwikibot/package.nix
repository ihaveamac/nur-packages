{
  fetchFromGitHub,
  buildDotnetModule,
  dotnetCorePackages,
  lib,
}:

buildDotnetModule rec {
  pname = "DiscordWikiBot";
  version = "0-unstable-2026-11-23";

  src = fetchFromGitHub {
    owner = "stjohann";
    repo = pname;
    rev = "5fee5f53daa1f980bb5a296809e0e30e73fed26b";
    hash = "sha256-favISebV1Aqp3ktDXXJ0pMSJfLq29jd/AyJNKsJn6C0=";
  };

  projectFile = "DiscordWikiBot/DiscordWikiBot.csproj";
  nugetDeps = ./deps.json;

  dotnet-runtime = dotnetCorePackages.aspnetcore_10_0;
  dotnet-sdk = dotnetCorePackages.sdk_10_0;

  meta = with lib; {
    description = "Discord bot for Wikimedia projects and MediaWiki wiki sites";
    homepage = "https://github.com/stjohann/DiscordWikiBot";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "DiscordWikiBot";
  };
}
