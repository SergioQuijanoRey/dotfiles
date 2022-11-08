# Home manager configuration
# This is imported from /etc/nixos/configuration.nix
# So don't use home-manager switch
# Instead, do regular nixos-rebuild switch

{ config, pkgs, ... }:
{

        home.username = "sergio";
        home.homeDirectory = "/home/sergio";

        home.stateVersion = "22.05";
        programs.home-manager.enable = true;

        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;

        home.packages =
        # Dev packages
        [
            pkgs.neovim             # Main editor
            pkgs.tree-sitter    # Neovim relies heavily on treesitter

            pkgs.tmux       # Terminal multiplexer
            pkgs.ripgrep    # Better grep
            pkgs.just       # Better version of makefile
            pkgs.rsync
            pkgs.act        # Run github actions locally
            pkgs.entr       # Run automatically commands when some file changes
            pkgs.jq         # Command line JSON pretty printer
            pkgs.lldb       # For debugging rust and c++ with nvim-dap
            pkgs.fzf        # Searching and piping in the terminal
            pkgs.rclone     # For syncing with google drive
            pkgs.rustup     # Rust ecosystem installer
            pkgs.git
            pkgs.tig        # ncurses terminal UI for git
                            # Useful for view different branches
            pkgs.acpi       # Check for battery status
            pkgs.rstudio    # Needed for some uni classes
            pkgs.gfortran   # Many R packages need fortran to compile
        ] ++

        # System packages
        [
            pkgs.zsh        # Shell enviroment
                            # Plugins need to be installed through normal package manager in order
                            # to be put in /usr/share/...

            pkgs.zplug                      # Plugin manager for zsh
            pkgs.zsh-autosuggestions        # Plugin for zsh
            pkgs.zsh-syntax-highlighting    # Plugin for zsh

            pkgs.zoxide     # Better cd command
            pkgs.ranger     # CLI file manager
            pkgs.w3m        # For displaying images in ranger
            pkgs.starship   # To configure terminal prompt
            pkgs.htop
            pkgs.bottom     # A better top alternative - like gotop but using rust
            pkgs.bat        # Better cat alternative
            pkgs.duf        # For seeing disk usage
            pkgs.rar        # To extract winrar files
            pkgs.exa        # Good replacement for ls and tree (exa -T)
            pkgs.fd         # Good replacement for find
            pkgs.ncdu       # To explore directories that take too much space
            pkgs.dunst      # Notifications
            pkgs.kitty      # Preferred terminal
            pkgs.trash-cli  # To have a trash-like behaviour in the command line
            pkgs.chromium   # Main web browser
            pkgs.sshfs      # To code on servers with local editors
            pkgs.docker     # Container technology
            pkgs.podman     # Container technology
            pkgs.crun       # Needed for running podman rootless
            pkgs.nerdfonts  # Icon font
            pkgs.jetbrains-mono # Preferred fonts
            pkgs.noto-fonts-emoji # Font that supports emojis
            pkgs.cascadia-code # Second preferred font
            pkgs.arandr     # To control multiple displays
            pkgs.lxappearance   # Set the system theme
            pkgs.networkmanagerapplet # Applet to connect to wifi
            pkgs.scrot # To take screenshots
            pkgs.betterlockscreen # For locking the screen
            pkgs.imagemagick # For blurring the lock screen
            pkgs.xclip # Sharing system and nvim clipboard
            pkgs.ntfs3g  # Mounting hdd with ntfs file format
            pkgs.alsa-utils # Having volume control keys
            pkgs.alsa-lib   # Having volume control keys
            pkgs.mate.engrampa # Working with compressed and zipped files
            pkgs.arc-theme # Preferred theme
            pkgs.bibata-cursors # Preferred cursor theme
            pkgs.youtube-dl  # Download music
            pkgs.rofi
            pkgs.rofi-emoji # Have a rofi emoji selector
            pkgs.nodePackages.npm # Some programns need this to build
            pkgs.libnotify # To have access to notify-send with dunst
            pkgs.evince
        ] ++

        # WM packages
        [
            pkgs.polybarFull
        ] ++

        # Messaging
        [
            pkgs.tdesktop
        ] ++

        # Videogame packages
        [
            pkgs.openspades
            pkgs.steam
        ] ++

        # Others
        [
            pkgs.calibre
            pkgs.spotify
            pkgs.keepassxc
        ];
}
