# List of the dev and system packages that we want to have installed in all of our systems
{pkgs, ...}:

let
    # Specify custom Python enviroment
    # `pp` is the passed python packages object
    custom_python_packages = pp: [
        pp.numpy
        pp.pytest
    ];
    custom_python_enviroment = pkgs.python310.withPackages custom_python_packages;

in

# Dev packages
[
    pkgs.neovim             # Main editor
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
    pkgs.git                # VCS
    pkgs.lazygit            # TUI client for git
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
    # TODO -- remove or bring it back
    # pkgs.rar                        # To extract winrar files
    pkgs.eza                        # Good replacement for ls and tree (exa -T)
    pkgs.fd                         # Good replacement for find
    pkgs.ncdu                       # To explore directories that take too much space
    pkgs.dunst                      # Notifications
    pkgs.alacritty                  # Preferred terminal
    pkgs.wezterm                    # Alternative terminal
    pkgs.trash-cli                  # To have a trash-like behaviour in the command line
    pkgs.firefox                    # Secondary web browser
    pkgs.sshfs                      # To code on servers with local editors
    pkgs.docker                     # Container technology
    pkgs.docker-compose             # Really simple docker orchestration
    pkgs.arandr                     # To control multiple displays
    pkgs.lxappearance               # Set the system theme
    pkgs.networkmanagerapplet       # Applet to connect to wifi
    pkgs.scrot                      # To take screenshots
    pkgs.betterlockscreen           # For locking the screen
    pkgs.imagemagick                # For blurring the lock screen
    pkgs.xclip                      # Sharing system and nvim clipboard
    pkgs.ntfs3g                     # Mounting hdd with ntfs file format
    pkgs.feh                        # For setting the wallpaper
    pkgs.shotwell                   # Useful when viewing a lot of images
    pkgs.mate.engrampa              # Working with compressed and zipped files
    pkgs.arc-theme                  # Preferred theme
    pkgs.yt-dlp                     # Download music. Original `youtube-dl` is not working
    pkgs.rofi
    pkgs.rofimoji                   # Have a rofi emoji selector
    pkgs.nodePackages.npm           # Some programns need this to build
    pkgs.libnotify                  # To have access to notify-send with dunst
    pkgs.evince                     # PDF Reader from Ubunut
    pkgs.zathura                    # PDF Reader for advanced users
    pkgs.dpkg
    pkgs.zip                        # To archive files
    pkgs.unzip                      # Some nvim LSPs need this to install
    pkgs.gnome.nautilus             # Graphic file explorer
    pkgs.nodejs                     # Some nvim LSPs need this
    pkgs.playerctl                  # To have play pause
    pkgs.patchelf                   # To work with mason.nvim
    pkgs.timer                      # To have a TUI timer for my pomodoro sessions
    pkgs.neofetch                   # Display some system info in the terminal
    pkgs.atuin                      # Better shell history
    pkgs.loc                        # Display lines of code
    pkgs.nushell                    # Alternative to zsh and bash
    pkgs.sd                         # Friendly alternative to sed

    # Disk usage utilities
    # duf shows how hard drives are used
    # dust shows disk usage of a specific dir
    pkgs.duf                        # For seeing disk usage
    pkgs.du-dust                    # Replacement for du written in Rust
] ++

# Programming languages and their LSPs
[
    # To work with rust projects
    pkgs.cargo

    # To work with OCaml
    pkgs.opam

    # Python with some packages installed
    custom_python_enviroment

    # Python linter
    pkgs.ruff

    # Nix
    pkgs.rnix-lsp

    # Lua
    pkgs.sumneko-lua-language-server
    pkgs.lua53Packages.lua-lsp

    # Julia
    pkgs.julia-bin

    # Latex
    pkgs.texlab

    # Markdown lsp
    pkgs.marksman
] ++

# Accessing android devices
[
    pkgs.jmtpfs
]
