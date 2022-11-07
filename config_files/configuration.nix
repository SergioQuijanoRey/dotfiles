# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
let
  # To use home manager as nixos module
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";

  # My username
  user = "sergio";
in
{ config, pkgs, ... }:

{
    imports =
    [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix

        # To use home manager as nixos module
        (import "${home-manager}/nixos")
    ];

    # Bootloader
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/boot/efi";
    };

    networking.hostName = "asus-laptop"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Madrid";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.utf8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "es_ES.utf8";
        LC_IDENTIFICATION = "es_ES.utf8";
        LC_MEASUREMENT = "es_ES.utf8";
        LC_MONETARY = "es_ES.utf8";
        LC_NAME = "es_ES.utf8";
        LC_NUMERIC = "es_ES.utf8";
        LC_PAPER = "es_ES.utf8";
        LC_TELEPHONE = "es_ES.utf8";
        LC_TIME = "es_ES.utf8";
    };

    # Configure keymap in X11
    services.xserver = {
        layout = "es";
        xkbVariant = "";
    };

    # Configure console keymap
    console.keyMap = "es";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${user} = {
        isNormalUser = true;
        description = "Sergio";

        # "audio" group is needed to work with pulse audio
        extraGroups = [ "networkmanager" "wheel" "audio"];
        packages = with pkgs; [];
        shell = pkgs.zsh;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    # TODO -- I need to clean this to left only system-critic packages
    environment.systemPackages = with pkgs; [
        neovim
        git
        kitty
        chromium
        zoxide
        lua
        starship
        pavucontrol
        pkgs.vimPlugins.packer-nvim
        python3
        feh
        tmux
        exa
        zsh
        blueman
        networkmanager
        dunst
        keepass
        killall
        gcc
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.05"; # Did you read the comment?

    # Use i3wm
    services.xserver = {
        enable = true;
        desktopManager = {
            xterm.enable = false;
        };

        displayManager = {
            defaultSession = "none+i3";
        };

        windowManager.i3 = {
            enable = true;
            extraPackages = with pkgs; [
                dmenu
                i3status
                i3lock
                i3blocks
            ];
        };
    };

    # Enable touchpad with natural scroll
    services.xserver.libinput = {
        enable = true;
        touchpad.naturalScrolling = true;
    };

    # Some packages as i3blocks try to read from /usr/bin
    # This way we avoid problems with that
    environment.pathsToLink = [ "/share" "/bin" "/libexec" "/usr/bin"];

    # Enable audio using Pulse
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;

    # Enable bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    # Home manager configuration
    home-manager.users.${user} = {
        home.username = "sergio";
        home.homeDirectory = "/home/sergio";

        home.stateVersion = "22.05";
        programs.home-manager.enable = true;

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
            pkgs.nodePackages.npm # Some programns need this to build
            pkgs.libnotify # To have access to notify-send with dunst
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
        ];

    };

    # Enable dconf so gtk2 apps display properly
    programs.dconf.enable = true;

    # Automatically garbage collection
    nix = {
        settings.auto-optimise-store = true;
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };
}

