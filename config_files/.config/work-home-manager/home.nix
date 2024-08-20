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
      pkgs.ranger
    ] ++

    # Dev packages
    [
      pkgs.just
      pkgs.neovim
      pkgs.trash-cli
      pkgs.bat
    ] ++

    # System packages
    [
      pkgs.bottom
      pkgs.sqlite
      pkgs.mate.engrampa
    ] ++

    # Desktop packages
    [
      pkgs.firefox
      pkgs.filezilla
    ] ++

    # Document writing
    [
      stablepkgs.typst
      stablepkgs.typstfmt
      stablepkgs.typst-lsp
      pkgs.pandoc
    ] ++
    ];
}
