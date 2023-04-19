{
    description = "Flake where I describe the configuration of my system";

    # Dependencies of the flake
    inputs = {
        # TODO -- change to stable branch but keep the unstable
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";

            # So we can use nixpkgs instead of home manager packages
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Flake that I install from github
        nurl = {
            url = "github:nix-community/nurl";
        };
    };

    outputs = { self, nixpkgs, home-manager, nurl }:
    let
        # Architecture of the system
        system = "x86_64-linux";

        # Packages repo
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ nurl.overlay ];
        };

        user = "sergio";
        hostname = "asus-laptop";

    in {
        nixosConfigurations = {
            ${hostname} = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [

                    # Import the base NixOS configuration
                    ./configuration.nix

                    # Set up home manager
                    home-manager.nixosModules.home-manager {

                        # So we can use nixpkgs instead of home manager packages
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;

                        # Import the home manager configuration
                        home-manager.users.${user} = {
                            imports = [ ./home.nix ];
                        };
                    }
                ];
            };
        };
    };
}
