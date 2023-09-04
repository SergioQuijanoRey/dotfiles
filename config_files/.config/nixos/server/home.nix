# Home manager onfiguration
# This is imported from /etc/nixos/configuration.nix
# So don't use home-manager switch
# Instead, do regular nixos-rebuild switch

{ config, pkgs, shared_packages, ... }:
{

    # Home manager needs this info to move around config files
    home.username = "sergio";
    home.homeDirectory = "/home/sergio";

    # Let home manager manage itself
    home.stateVersion = "22.05";
    programs.home-manager.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List of packages
    home.packages =

    shared_packages ++

    # Fonts
    [
        # Font that supports emojis
        pkgs.noto-fonts-emoji

        # Do not install all nerd fonts, which takes a long time
        # Pick specific fonts I want
        # Names for this fonts can be looked up at:
        #   https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
        (pkgs.nerdfonts.override {
            fonts = [
                "FiraCode"
                "Inconsolata"
                "JetBrainsMono"
                "CascadiaCode"
            ];
        })
    ];

    # Fonts cannot be installed as normal packages
    # We need to specify this to reload font cache
    fonts.fontconfig.enable = true;

    # We can configure zsh using home manager
    # So we specify the installation this way
    programs.zsh = {
        enable = true;

        # Manage plugins here
        zplug = {
            enable = true;
            plugins = [
                { name = "zsh-users/zsh-autosuggestions"; }
                { name = "zsh-users/zsh-syntax-highlighting"; }

                # This plugin is used to use `atuin` program, that changes
                # the shell history search
                { name = "atuinsh/atuin"; }
            ];
        };

        # So we source ~/.zsh_dotfiles where the rest of the config is
        initExtra = "source ~/.zsh_dotfiles";
    };
}
