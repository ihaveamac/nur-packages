{
  fetchFromGitHub,
  buildDotnetModule,
  dotnetCorePackages,
  lib,
}:

buildDotnetModule rec {
  pname = "DiscordWikiBot";
  version = "0-unstable-2026-09-24";

  src = fetchFromGitHub {
    owner = "stjohann";
    repo = pname;
    rev = "baaf0257367c32fd5161cd79405fced6023e8d1c";
    hash = "sha256-wIrKWLx9+4iU/rcYHbYxJ2/Z63TmdbH5c3pxku3LKmk=";
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
