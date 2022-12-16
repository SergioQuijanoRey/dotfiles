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

    # Specify python packages
    my-python-packages = python-packages: with python-packages; [
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
    python_my_packages = python39.withPackages my-python-packages;

    # Latex enviroment
    custom_tex_env = (pkgs.texlive.combine {
        # Base latex env
        inherit (pkgs.texlive) scheme-medium

        # Extra packages that we want
        amsmath
        hyperref
        cancel
        esvect

        # Packages that I need for my thesis template to compile
        koma-script
        xpatch
        cabin
        fontaxes
        inconsolata
        xurl
        upquote
        ;
    });
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
        # TODO -- uncomment
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
        custom_tex_env          # Latex enviroment that we've defined before
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
        pkgs.playerctl                  # To have play pause


    ] ++

    # Programming languages and their LSPs
    [
        # Python, with the packages for development (ie. pandas) and LSP packages
        python_my_packages

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
        pkgs.spicy

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
        pkgs.xournalpp      # For writting docs using the HUION tablet
        pkgs.onlyoffice-bin # Alternative to MS Office
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
        ];
    };
}
