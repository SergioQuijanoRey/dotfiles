{
  description = "Flake where I describe the configuration of my different machines (laptop and home server)";

  # Dependencies of the flake
  inputs = {
    # We have two versions of nixpkgs so we can update more frequently one input
    # on which only relies a subset of bleeding-edge packages
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    latestnixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";


    home-manager = {
      url = "github:nix-community/home-manager";

      # So we can use nixpkgs instead of home manager packages
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Some videogames need this package to run with hardware acceleration
    nixgl_flake = {
        url = "github:guibou/nixGL";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    # Flakes that I added from github
    , nixgl_flake
    , latestnixpkgs
    } @ inputs:
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
      nixgl = nixgl_flake.packages.${system}.default;
    in
    {
      nixosConfigurations = {
        # Config my workstation
        workstation = lib.nixosSystem {
          inherit system;
          specialArgs = {inherit inputs; };

          modules = [

            # Import the base NixOS configuration
            ./workstation/configuration.nix

            # Set up home manager
            home-manager.nixosModules.home-manager
            {

              # Import the home manager configuration
              home-manager.users.${user} = {
                imports = [ ./workstation/home.nix ];
              };

              # We are using this for passing nix flakes from github
              # and also using the shared list of packages
              home-manager.extraSpecialArgs = {
                inherit nixgl;
                dev_packages = import ./shared/dev_packages.nix {
                    pkgs = pkgs;
                    latestpkgs = latestpkgs;
                };
                wm_packages = import ./shared/wm_packages.nix {
                    pkgs = pkgs;
                    latestpkgs = latestpkgs;
                };
                latestpkgs = latestpkgs;
              };
            }
          ];
        };
      };
    };
}
