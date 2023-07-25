# Home manager onfiguration
# This is imported from /etc/nixos/configuration.nix
# So don't use home-manager switch
# Instead, do regular nixos-rebuild switch

{ config, pkgs, ... }:

with pkgs;
let
    # Specify custom Python enviroment
    custom_python_packages = python-packages: with python-packages; [
        numpy
    ];
    custom_python_enviroment = python310.withPackages custom_python_packages;

in

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

    # Dev packages
    [
        pkgs.neovim-unwrapped   # Main editor
        pkgs.tree-sitter        # Neovim relies heavily on treesitter
        pkgs.tmux               # Terminal multiplexer
        pkgs.zellij             # Good alternative for zellij
        pkgs.ripgrep            # Better grep
        pkgs.just               # Better version of makefile
        pkgs.rsync
        pkgs.act                # Run github actions locally
        pkgs.entr               # Run automatically commands when some file changes
        pkgs.jq                 # Command line JSON pretty printer
        pkgs.lldb               # For debugging rust and c++ with nvim-dap
        pkgs.fzf                # Searching and piping in the terminal
        pkgs.rclone             # For syncing with google drive
        pkgs.rustup             # Rust ecosystem installer
        pkgs.git
        pkgs.acpi               # Check for battery status
        pkgs.pandoc             # Tools like rmarkdown need this
        pkgs.sqlite             # Database engine that I use in some backends
        pkgs.xh                 # Good alternative to curl

    ] ++

    # System packages
    [
        pkgs.zoxide                     # Better cd command
        pkgs.ranger                     # CLI file manager
        pkgs.w3m                        # For displaying images in ranger
        pkgs.wget                       # A lot of tools rely on this package
        pkgs.starship                   # To configure terminal prompt
        pkgs.htop                       # Monitoring tool
        pkgs.bottom                     # A better top alternative - like gotop but using rust
        pkgs.bat                        # Better cat alternative
        pkgs.rar                        # To extract winrar files
        pkgs.exa                        # Good replacement for ls and tree (exa -T)
        pkgs.fd                         # Good replacement for find
        pkgs.ncdu                       # To explore directories that take too much space
        pkgs.dunst                      # Notifications
        pkgs.alacritty                  # Preferred terminal
        pkgs.wezterm                    # Alternative terminal
        pkgs.trash-cli                  # To have a trash-like behaviour in the command line
        pkgs.chromium                   # Main web browser
        pkgs.firefox                    # Secondary web browser
        pkgs.sshfs                      # To code on servers with local editors
        pkgs.docker                     # Container technology
        pkgs.arandr                     # To control multiple displays
        pkgs.lxappearance               # Set the system theme
        pkgs.networkmanagerapplet       # Applet to connect to wifi
        pkgs.scrot                      # To take screenshots
        pkgs.betterlockscreen           # For locking the screen
        pkgs.imagemagick                # For blurring the lock screen
        pkgs.xclip                      # Sharing system and nvim clipboard
        pkgs.ntfs3g                     # Mounting hdd with ntfs file format
        pkgs.feh                        # For setting the wallpaper
        pkgs.alsa-utils                 # Having volume control keys
        pkgs.alsa-lib                   # Having volume control keys
        pkgs.alsa-plugins               # Having volume control keys
        pkgs.mate.engrampa              # Working with compressed and zipped files
        pkgs.arc-theme                  # Preferred theme
        pkgs.yt-dlp                     # Download music. Original `youtube-dl` is not working
        pkgs.rofi
        pkgs.rofimoji                   # Have a rofi emoji selector
        pkgs.nodePackages.npm           # Some programns need this to build
        pkgs.libnotify                  # To have access to notify-send with dunst
        pkgs.evince
        pkgs.dpkg
        pkgs.zip                        # To archive files
        pkgs.unzip                      # Some nvim LSPs need this to install
        pkgs.gnome.nautilus             # Graphic file explorer
        pkgs.nodejs                     # Some nvim LSPs need this
        pkgs.playerctl                  # To have play pause
        pkgs.patchelf                   # To work with mason.nvim
        pkgs.neofetch                   # Display some system info in the terminal

        # Disk usage utilities
        # duf shows how hard drives are used
        # dust shows disk usage of a specific dir
        pkgs.duf                        # For seeing disk usage
        pkgs.du-dust                    # Replacement for du written in Rust
    ] ++

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
            ];
        };

        # So we source ~/.zsh_dotfiles where the rest of the config is
        initExtra = "source ~/.zsh_dotfiles";
    };
}
