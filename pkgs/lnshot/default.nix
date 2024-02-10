{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "lnshot";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "ticky";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-RkeLA1ieuDCJueDxgifef52yJr+DGCEMOAQ3hn9DieA=";
  };

  cargoHash = "sha256-9G55NliADKIr9UhvZXYhsM5LBAPkZ0+5akJH4UWY9ZI=";

  meta = with lib; {
    description = "Symlink your Steam screenshots to a sensible place";
    homepage = "https://github.com/ticky/lnshot";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
