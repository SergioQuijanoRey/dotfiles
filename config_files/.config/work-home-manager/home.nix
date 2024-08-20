{ config, pkgs, stablepkgs, ... }:

let
  # Specify custom Python enviroment
  # `pp` is the passed python packages object
  custom_python_packages = pp: [
    pp.numpy
    pp.pandas
    pp.pytest
    pp.oscrypto
    pp.virtualenv
  ];
  custom_python_enviroment = pkgs.python310.withPackages custom_python_packages;

in
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
      pkgs.yazi
      pkgs.taskwarrior3
      pkgs.vit
    ] ++

    # Dev packages
    [
      pkgs.just
      pkgs.neovim
      pkgs.trash-cli
      pkgs.bat
      pkgs.snowsql
      pkgs.lazygit
      pkgs.docker_26

      # Custom packages for python
      custom_python_enviroment
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
      pkgs.zathura
    ] ++

    # Document writing
    [
      stablepkgs.typst
      stablepkgs.typstfmt
      stablepkgs.typst-lsp
      pkgs.pandoc
    ] ++

    # Lib packages
    [
      pkgs.glibc
      pkgs.libcxx
    ];

  # Set the mime types
  xdg.mimeApps =
  let
    # Don't repeat the same mappings over and over
    xdg_mime_mappings = {
        "application/pdf" = ["zathura.desktop"];
    };
  in
  {
      enable = true;
      associations.added = xdg_mime_mappings;
      defaultApplications = xdg_mime_mappings;
  };
}
