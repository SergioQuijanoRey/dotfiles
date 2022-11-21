# Home manager configuration
# This is imported from /etc/nixos/configuration.nix
# So don't use home-manager switch
# Instead, do regular nixos-rebuild switch

{ config, pkgs, ... }:
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
        pkgs.neovim             # Main editor
        pkgs.tree-sitter        # Neovim relies heavily on treesitter

        pkgs.tmux               # Terminal multiplexer
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
        pkgs.tig                # ncurses terminal UI for git
                                # Useful for view different branches
        pkgs.acpi               # Check for battery status
        pkgs.gfortran           # Many R packages need fortran to compile
        pkgs.gnumake            # R lsp needs this package
        pkgs.pandoc             # Tools like rmarkdown need this

        # Packages that I use for machine learning with python
        pkgs.python310Packages.jupyterlab
        pkgs.python310Packages.pytorch
        pkgs.python310Packages.torchvision
        pkgs.python310Packages.matplotlib
        pkgs.python310Packages.numpy
        pkgs.python310Packages.seaborn
        pkgs.python310Packages.wandb
        pkgs.python310Packages.scikit-learn
        pkgs.python310Packages.tqdm
        pkgs.python310Packages.snakeviz

    ] ++

    # System packages
    [
        pkgs.zsh        # Shell enviroment
                        # Plugins need to be installed through normal package manager in order
                        # to be put in /usr/share/...

        pkgs.zplug                      # Plugin manager for zsh
        pkgs.zsh-autosuggestions        # Plugin for zsh
        pkgs.zsh-syntax-highlighting    # Plugin for zsh

        pkgs.zoxide                     # Better cd command
        pkgs.ranger                     # CLI file manager
        pkgs.w3m                        # For displaying images in ranger
        pkgs.starship                   # To configure terminal prompt
        pkgs.htop
        pkgs.bottom                     # A better top alternative - like gotop but using rust
        pkgs.bat                        # Better cat alternative
        pkgs.duf                        # For seeing disk usage
        pkgs.rar                        # To extract winrar files
        pkgs.exa                        # Good replacement for ls and tree (exa -T)
        pkgs.fd                         # Good replacement for find
        pkgs.ncdu                       # To explore directories that take too much space
        pkgs.dunst                      # Notifications
        pkgs.kitty                      # Preferred terminal
        pkgs.trash-cli                  # To have a trash-like behaviour in the command line
        pkgs.chromium                   # Main web browser
        pkgs.firefox                    # Secondary web browser
        pkgs.sshfs                      # To code on servers with local editors
        pkgs.docker                     # Container technology
        pkgs.podman                     # Container technology
        pkgs.crun                       # Needed for running podman rootless
        pkgs.arandr                     # To control multiple displays
        pkgs.lxappearance               # Set the system theme
        pkgs.networkmanagerapplet       # Applet to connect to wifi
        pkgs.scrot                      # To take screenshots
        pkgs.betterlockscreen           # For locking the screen
        pkgs.imagemagick                # For blurring the lock screen
        pkgs.xclip                      # Sharing system and nvim clipboard
        pkgs.ntfs3g                     # Mounting hdd with ntfs file format
        pkgs.alsa-utils                 # Having volume control keys
        pkgs.alsa-lib                   # Having volume control keys
        pkgs.alsa-plugins               # Having volume control keys
        pkgs.mate.engrampa              # Working with compressed and zipped files
        pkgs.arc-theme                  # Preferred theme
        pkgs.bibata-cursors             # Preferred cursor theme
        pkgs.youtube-dl                 # Download music
        pkgs.rofi
        pkgs.rofi-emoji                 # Have a rofi emoji selector
        pkgs.nodePackages.npm           # Some programns need this to build
        pkgs.libnotify                  # To have access to notify-send with dunst
        pkgs.evince
        pkgs.dpkg
        pkgs.unzip                      # Some nvim LSPs need this to install
        pkgs.gnome.nautilus             # Graphic file explorer
        pkgs.nodejs                     # Some nvim LSPs need this


    ] ++

    # Programming languages and their LSPs
    [
        # Python
        pkgs.python310
        pkgs.python310Packages.pip
        pkgs.python310Packages.python-lsp-server  # Pylsp for nvim lsp
        pkgs.python310Packages.pylsp-mypy
        pkgs.mypy

        pkgs.python310Packages.pyls-isort         # Pylsp plugin
        pkgs.python310Packages.isort

        pkgs.python310Packages.pyls-flake8        # Pylsp plugin
        pkgs.nodePackages.pyright                 # Pyright for nvim lps

        # Nix
        pkgs.rnix-lsp

        # R
        pkgs.R                          # R programming language
        pkgs.rstudio                    # Needed for some uni classes
        pkgs.rPackages.languageserver   # LSP for R

        # Lua
        pkgs.lua53Packages.lua-lsp

        # Rust
        pkgs.rust-analyzer
    ] ++

    # WM components packages
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
        pkgs.lutris

        # Without this package, steam fails to open
        pkgs.xorg.libxcb
    ] ++

    # Fonts
    [
        pkgs.nerdfonts                  # Icon font
        pkgs.jetbrains-mono             # Preferred fonts
        pkgs.noto-fonts-emoji           # Font that supports emojis
        pkgs.cascadia-code              # Second preferred font
    ] ++

    # Desktop packages
    [
        pkgs.calibre
        pkgs.spotify
        pkgs.keepassxc
        pkgs.syncthing
    ];

    # Fonts cannot be installed as normal packages
    # We need to specify this to reload font cache
    fonts.fontconfig.enable = true;

    # Declare which chromium extension we are using
    programs.chromium = {
        enable = true;
        extensions = [

            # Notion web clipper
            { id = "knheggckgoiihginacbkhaalnibhilkk"; }

            # Vimium
            { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; }

            # Ad blocker
            { id = "gighmmpiobklfepjocnamgkkbiglidom"; }

            # Preview markdown files in the browser
            { id = "ckkdlimhmcjmikdlpkmbgfkaikojcbjk"; }
        ];
    };
}
