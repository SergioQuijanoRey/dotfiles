{
  description = "Flake where I describe the configuration of my different machines (laptop and home server)";

  # Dependencies of the flake
  inputs = {
    # We have two versions of nixpkgs so we can update more frequently one input
    # on which only relies a subset of bleeding-edge packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    latestnixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
    nixgl_flake = {
      url = "github:guibou/nixGL";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , # Flakes that I added from github
      zerospades_flake
    , nixgl_flake
    , latestnixpkgs
    , hyprland
    }:
    let
      # Architecture of the system
      system = "x86_64-linux";

      # Sometimes we want to use lib functions
      lib = nixpkgs.lib;

      pkgs = nixpkgs.legacyPackages.${system};
      latestpkgs = latestnixpkgs.legacyPackages.${system};


      # In all my machines I use the same username
      user = "sergio";

      # Get the parts from the flakes that I want to keep
      # Flakes usually ship more than one thing: packages (different versions
      # for each system), overlays, ...
      zerospades = zerospades_flake.packages.${system}.default;
      nixgl = nixgl_flake.packages.${system}.default;
    in
    {
      nixosConfigurations = {

        # Config for my laptop
        asus-laptop = lib.nixosSystem {
          inherit system;
          modules = [

            # Import the base NixOS configuration
            ./laptop/configuration.nix

            # Set up home manager
            home-manager.nixosModules.home-manager
            {


              # So we can use nixpkgs instead of home manager packages
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              # Import the home manager configuration
              home-manager.users.${user} = {
                imports = [ ./laptop/home.nix ];
              };

              # We are using this for passing nix flakes from github
              # and also using the shared list of packages
              home-manager.extraSpecialArgs = {
                inherit zerospades nixgl;
                dev_packages = import ./shared/dev_packages.nix pkgs;
                wm_packages = import ./shared/wm_packages.nix pkgs;
                latestpkgs = latestpkgs;
              };
            }

            # Setup hyprland
            hyprland.nixosModules.default
          ];
        };

        # Config for my home server
        lenovo-server = lib.nixosSystem
          {
            inherit system;
            modules = [

              # Import the base NixOS configuration
              ./server/configuration.nix

              # Set up home manager
              home-manager.nixosModules.home-manager
              {

                # So we can use nixpkgs instead of home manager packages
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                # Import the home manager configuration
                home-manager.users.${user} = {
                  imports = [ ./server/home.nix ];
                };

                # In the server I don't want neither videogame flakes nor wm packages
                home-manager.extraSpecialArgs = {
                  dev_packages = import ./shared/dev_packages.nix pkgs;
                };
              }
            ];
          };
      };

    };
}
