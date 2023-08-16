# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
let
  # My username
  user = "sergio";
in
{ config, pkgs, ... }:

{
    imports =
    [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

    # Bootloader
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/boot/efi";

        systemd-boot.configurationLimit = 3;
    };

    # Add support for NTFS format
    boot.supportedFilesystems = [ "ntfs" ];

    networking.hostName = "asus-laptop";  # Define your hostname.
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
    environment.systemPackages = with pkgs; [
        # Really basic packages
        tmux
        git
        kitty
        file
        killall
        gcc

        # WM packages
        pavucontrol
        blueman
        networkmanager
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
    # Enable touchpad with natural scroll, disable while typing
    services.xserver.libinput = {
        enable = true;
        touchpad.naturalScrolling = true;
        touchpad.disableWhileTyping = true;
    };


    # Try out hyprland
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;  # For running some X applications
    };

    # Some configs for wayland
    environment.sessionVariables = {

        # Avoid cursor becoming invisible
        WLR_NO_HARDWARE_CURSOS = "1";

        # Allow software graphics acceleration
        WLR_RENDERER_ALLOW_SOFTWARE = "1";

        # Tell electron apps to use wayland
        NIXOS_OZONE_WL = "1";
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

    # This is setup in `Home Manager`, but as we specify
    #   `users.users.sergio.shell = zsh`
    # we need this line too
    programs.zsh.enable = true;

    # I want to install some packages using flatpack
    services.flatpak.enable = true;
    xdg.portal = { # Desktop integration
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        enable = true;
    };

    # I want neovim as the default editor
    environment.variables.EDITOR = "nvim";

    # Systemd service to run kanata as a demon
    # NixOS has a custom module for Kanata but this way is easier to use
    systemd.services.customKanata = {
        enable = true;
        description = "Custom Kanata service, to run the remappings in the background";
        unitConfig = {
            Type = "simple";
        };

        # The package that we use is installed with this declaration
        # So no need to install it in other place, such as `home.nix`
        serviceConfig = {
            ExecStart = "${pkgs.kanata-with-cmd}/bin/kanata -c /home/sergio/.config/kanata/default.kdb";
            Restart = "always";
            RestartSec = 10;
        };
        wantedBy = [ "multi-user.target" ];
    };

    # Enable nix flakes in NixOS and home manager
    # nix = {
    #     package = pkgs.nixFlakes;
    #     extraOptions = "experimental-features = nix-command flakes";
    # };
}

