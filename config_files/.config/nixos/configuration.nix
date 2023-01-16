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

    # Add support for NTFS format
    boot.supportedFilesystems = [ "ntfs" ];

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

        # Enable HUION tablet utilities
        # For example, xsetwacom command
        wacom.enable = true;
    };

    # Configure console keymap
    console.keyMap = "es";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${user} = {
        isNormalUser = true;
        description = "Sergio";

        # "audio" group is needed to work with pulse audio
        # "docker" is needed to interact with docker commands
        extraGroups = [ "networkmanager" "wheel" "audio" "docker"];
        packages = with pkgs; [];
        shell = pkgs.zsh;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    # TODO -- I need to clean this to left only system-critic packages
    environment.systemPackages = with pkgs; [
        git
        file
        kitty
        chromium
        zoxide
        lua
        starship
        pavucontrol
        pkgs.vimPlugins.packer-nvim
        feh
        tmux
        exa
        zsh
        blueman
        networkmanager
        dunst
        killall
        gcc
    ];

    # Load user home manager configuration
    home-manager.users.sergio = import ./home.nix;

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

    # Enable touchpad with natural scroll, disable while typing
    services.xserver.libinput = {
        enable = true;
        touchpad.naturalScrolling = true;
        touchpad.disableWhileTyping = true;
    };

    # Some packages as i3blocks try to read from /usr/bin
    # This way we avoid problems with that
    environment.pathsToLink = [ "/share" "/bin" "/libexec" "/usr/bin"];

    # Enable audio using Pulse
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;

    # Enable audio using ALSA, for media keys in i3
    sound.enable = true;

    # Enable bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    # Enable dconf so gtk2 apps display properly
    programs.dconf.enable = true;

    # Enable docker
    virtualisation.docker = {
        enable = true;
        rootless.enable = true;
    };

    # Without this, steam does not work
    hardware.opengl.driSupport32Bit = true;
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    # I want to install some packages using flatpack
    services.flatpak.enable = true;
    xdg.portal = { # Desktop integration
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        enable = true;
    };

    # I want neovim as the default editor
    environment.variables.EDITOR = "nvim";

    # TODO -- disabled because it messes with all my shell.nix'es and makes my
    # computer very slow when its cleaning
    #
    # Automatically garbage collection
    # nix = {
    #     settings.auto-optimise-store = true;
    #     gc = {
    #         automatic = true;
    #         dates = "weekly";
    #         options = "--delete-older-than 7d";
    #     };
    # };
}

