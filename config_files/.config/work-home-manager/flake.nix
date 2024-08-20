{
  description = "Home Manager configuration of sergio";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stablenixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stablenixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      stablepkgs = stablenixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."sergio" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];

        # We are using this for passing nix flakes from github
        # and also using the shared list of packages
        extraSpecialArgs = {
            stablepkgs = stablepkgs;
        };
      };
    };
}
