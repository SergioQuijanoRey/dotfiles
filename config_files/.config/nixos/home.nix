# Home manager onfiguration
# This is imported from /etc/nixos/configuration.nix
# So don't use home-manager switch
# Instead, do regular nixos-rebuild switch

{ config, pkgs, ... }:

with pkgs;
let
    # Specify R packages
    R-with-my-packages = rWrapper.override {
        packages = with rPackages; [
            # LSP and packages required
            languageserver
            languageserversetup
            xml2

            # Stats packages
            ggpubr
        ];
    };

    # Specify custom Python enviroment
    custom_python_packages = python-packages: with python-packages; [
        # Normal packages
        matplotlib
        numpy
        scikit-learn
        tqdm
        snakeviz
        pytorch
        torchvision
        jupyterlab
        seaborn
        wandb
        pip
        pandas

        # Managing Excel files
        xlrd
        xlwt

        # pylsp is the main LSP for python
        python-lsp-server

        # pylsp modules
        pylsp-mypy
        pyls-isort          # Pylsp plugin
        pyls-flake8         # Pylsp plugin

        # Dependencies for python lsp modules
        mypy
        isort

    ];
    custom_python_enviroment = python39.withPackages custom_python_packages;

    # Polybar needs to set an i3 attribute
    custom_polybar = pkgs.polybar.override {
        i3Support = true;
    };

    # Custom build of this go package
    timer = (import ./custom_packages/timer.nix);
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
        pkgs.sqlite             # Database engine that I use in some backends

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
        pkgs.wget                       # A lot of tools rely on this package
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
        pkgs.feh                        # For setting the wallpaper
        pkgs.alsa-utils                 # Having volume control keys
        pkgs.alsa-lib                   # Having volume control keys
        pkgs.alsa-plugins               # Having volume control keys
        pkgs.mate.engrampa              # Working with compressed and zipped files
        pkgs.arc-theme                  # Preferred theme

        # TODO -- this package is failing
        # pkgs.bibata-cursors             # Preferred cursor theme

        pkgs.youtube-dl                 # Download music
        pkgs.rofi
        pkgs.rofi-emoji                 # Have a rofi emoji selector
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

        # Timer, custom build
        timer


    ] ++

    # Programming languages and their LSPs
    [
        # TODO -- uncomment
        # Python with some packages installed
        # custom_python_enviroment

        # Python linter
        ruff

        # Nix
        pkgs.rnix-lsp

        # R with the packages specified at the start
        R-with-my-packages
        pkgs.xml2                       # Needed for LSP to work
        pkgs.rstudio                    # Needed for some uni classes

        # Lua
        pkgs.sumneko-lua-language-server
        pkgs.lua53Packages.lua-lsp

        # Rust
        pkgs.rust-analyzer

        # Rust webdev
        pkgs.trunk      # For serving yew.rs apps
        pkgs.diesel-cli # For starting diesel ORM

        # Julia
        pkgs.julia-bin

        # Latex
        pkgs.texlab

        # Markdown lsp
        marksman
    ] ++

    # WM components packages
    [
        # Using a custom version of polybar with support for i3
        custom_polybar
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

        # Minecraft launcher
        pkgs.prismlauncher

        # Without this package, steam fails to open
        pkgs.xorg.libxcb
    ] ++

    # Fonts
    [
        pkgs.jetbrains-mono             # Preferred fonts
        pkgs.noto-fonts-emoji           # Font that supports emojis
        pkgs.cascadia-code              # Second preferred font

        # Do not install all nerd fonts, which takes a long time
        # (pkgs.nerdfonts.override {
        #     fonts = [
        #         "FiraCode"
        #     ];
        # })
        pkgs.nerdfonts
    ] ++

    # Desktop packages
    [
        pkgs.calibre
        pkgs.spotify
        pkgs.keepassxc
        pkgs.syncthing
        pkgs.xournalpp      # For writting docs using the HUION tablet
        pkgs.onlyoffice-bin # Alternative to MS Office
        pkgs.obs-studio     # Streaming and recording
        pkgs.obsidian       # Notes
    ] ++

    # Other packages
    [
        taskwarrior     # For managing tasks through the terminal
        vit             # CLI Frontend for taskwarrior

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

            # Twitch ad blocker
            { id = "lehcglgkjkamolcflammloedahjocbbg"; }

            # Dark mode
            { id = "dmghijelimhndkbmpgbldicpogfkceaj"; }

            # Generate bibtex references from webpages
            { id = "phidhnmbkbkbkbknhldmpmnacgicphkf"; }
        ];
    };



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
