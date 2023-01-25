{
    description = "Flake where I describe the configuration of my system";

    # Dependencies of the flake
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";

            # So we can use nixpkgs instead of home manager packages
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager }:
    let
        # Architecture of the system
        system = "x86_64-linux";

        # Package repo
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };

        username = "sergio";
        hostname = "asus-laptop";

    in {
        nixosConfigurations = {
            ${hostname} = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    # Load the base NixOS configuration
                    ./configuration.nix

                    # Load the home manager configuration
                    home-manager.nixosModules.home-manager {

                        # So we can use nixpkgs instead of home manager packages
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.${username} = {
                            imports = [ ./home.nix ];
                        };
                    }
                ];
            };
        };
    };
}
