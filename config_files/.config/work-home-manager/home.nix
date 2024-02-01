{ config, pkgs, ... }:

{
  # Home manager needed info
  home.username = "sergio";
  home.homeDirectory = "/home/sergio";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  home.packages =
    # Shell experience packages
    [
      pkgs.zellij
      pkgs.zoxide
    ] ++

    # Dev packages
    [
      pkgs.just
      pkgs.neovim
      pkgs.megatools
      pkgs.trash-cli
    ] ++

    # System packages
    [
      pkgs.bottom
    ];
}
