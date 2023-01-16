# Derivation to install https://github.com/caarlos0/timer

with import <nixpkgs> {};
buildGoModule rec {
  pname = "timer";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "caarlos0";
    repo = "timer";
    rev = "v${version}";
    sha256 = "sha256-/HGr1TT+oYEub4N0uf0Wvd18GhJBtruPTZr9DHhG4rU=";
  };

  vendorHash = "sha256-EXb/Nz3dTTUUHZ9f55cDnQyrD8biRbgcovQEYi4LH74=";

  meta = with lib; {
    description = "A `sleep` with progress";
    homepage = "https://github.com/caarlos0/timer";
    license = licenses.mit;
    maintainers = with maintainers; [ sergio ];
  };
}
