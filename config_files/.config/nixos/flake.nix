{
    description = "Flake where I describe the configuration of my different machines (laptop and home server)";

    # Dependencies of the flake
    inputs = {
        # TODO -- change to stable branch but keep the unstable
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";

            # So we can use nixpkgs instead of home manager packages
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Videogame that I want to install from Github Flake
        zerospades_flake = {
            url = "github:siecvi/zerospades";
        };

        # Some videogames need this package to run with hardware acceleration
        nixgl_flake  = {
            url = "github:guibou/nixGL";
        };

    };

    outputs = {
        self, nixpkgs, home-manager,

        # Flakes that I added from github
        zerospades_flake,
        nixgl_flake,
    }:
    let
        # Architecture of the system
        system = "x86_64-linux";

        # Sometimes we want to use lib functions
        lib = nixpkgs.lib;

        pkgs = nixpkgs.legacyPackages.${system};

        # In all my machines I use the same username
        user = "sergio";

        # Get the parts from the flakes that I want to keep
        # Flakes usually ship more than one thing: packages (different versions
        # for each system), overlays, ...
        zerospades = zerospades_flake.packages.${system}.default;
        nixgl = nixgl_flake.packages.${system}.default;

        # Pass this flakes to home-manager using special args
        # Useful for flakes that does not expose an overlay
        specialArgs = {
            inherit zerospades nixgl;
            shared_packages = import ./shared/dev_packages.nix pkgs;
        };

    in {
        nixosConfigurations = {

            # Config for my laptop
            asus-laptop = lib.nixosSystem {
                inherit system ;
                modules = [

                    # Import the base NixOS configuration
                    ./laptop/configuration.nix

                    # Set up home manager
                    home-manager.nixosModules.home-manager {


                        # So we can use nixpkgs instead of home manager packages
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;

                        # Import the home manager configuration
                        home-manager.users.${user} = {
                            imports = [ ./laptop/home.nix ];
                        };

                        # We are using this for passing nix flakes from github
                        # and also using the shared list of packages
                        home-manager.extraSpecialArgs = specialArgs;
                    }
                ];
            };

            # Config for my home server
            lenovo-server = lib.nixosSystem {
                inherit system;
                modules = [

                    # Import the base NixOS configuration
                    ./server/configuration.nix

                    # Set up home manager
                    home-manager.nixosModules.home-manager {

                        # So we can use nixpkgs instead of home manager packages
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;

                        # Import the home manager configuration
                        home-manager.users.${user} = {
                            imports = [ ./server/home.nix ];
                        };

                        # We are using this for passing nix flakes from github
                        # and also using the shared list of packages
                        home-manager.extraSpecialArgs = specialArgs;
                    }
                ];
            };
        };

    };
}
