{ config, pkgs, stdenv, ... }:

let

    # Custom channels
    # nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl
    nixgl = import <nixgl> {};

in

{
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "sergio";
    home.homeDirectory = "/home/sergio";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    home.packages =

    # Dev packages
    [
        # Main editor
        pkgs.neovim
        pkgs.tree-sitter

        # I use zig to avoid nvim treesitter fails
        pkgs.zig
    ] ++

    # Videogames packages
    [
        pkgs.openspades
        nixgl.auto.nixGLDefault
    ];
}
