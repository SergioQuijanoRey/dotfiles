# Derivation to install https://github.com/caarlos0/timer

with import <nixpkgs> {};
buildGoModule rec {
  pname = "timer";
  version = "1.2.0";

  # Use `github.com/nix-community/nurl` to get this data
  src = fetchFromGitHub {
    owner = "caarlos0";
    repo = "timer";
    rev = "50561bc33b32d1a07cddf8264e3cbb134f425463";
    sha256 = "sha256-9p/L3Hj3VqlNiyY3lfUAhCjwTl1iSTegWxaVEGB4qHM=";
  };

  vendorHash = "sha256-j7Xik0te6GdjfhXHT7DRf+MwM+aKjfgTGvroxnlD3MM=";

  meta = with lib; {
    description = "A `sleep` with progress";
    homepage = "https://github.com/caarlos0/timer";
    license = licenses.mit;
    maintainers = with maintainers; [ sergio ];
  };
}
