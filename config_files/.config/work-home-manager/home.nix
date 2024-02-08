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
      pkgs.nushell
    ] ++

    # Dev packages
    [
      pkgs.just
      pkgs.neovim
      pkgs.trash-cli
    ] ++

    # System packages
    [
      pkgs.bottom
      pkgs.sqlite
    ] ++

    # Desktop packages
    [
      pkgs.firefox
    ];
}
