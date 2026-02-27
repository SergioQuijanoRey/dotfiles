{
  description = "Flake where I describe the configuration of my different machines (laptop and home server)";

  # Dependencies of the flake
  inputs = {

    # NOTE -- to come back to stable release:
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";

      # So we can use nixpkgs instead of home manager packages
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {url = "github:FKouhai/helium2nix/main";};

  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , helium
    } @ inputs:
    let
      # Architecture of the system
      system = "x86_64-linux";

      # Sometimes we want to use lib functions
      lib = nixpkgs.lib;

      pkgs = nixpkgs.legacyPackages.${system};

      # In all my machines I use the same username
      user = "sergio";

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
                dev_packages = import ./shared/dev_packages.nix {
                    pkgs = pkgs;
                };
                wm_packages = import ./shared/wm_packages.nix {
                    pkgs = pkgs;
                };

                helium = helium;
                system = system;
              };
            }
          ];
        };
      };
    };
}
