# Imported from `flake.nix` so no need to do a Home Manager rebuild
{ config, pkgs, dev_packages, wm_packages, latestpkgs, nur, ... }:
{
  # Home manager needs this info to move around config files
  home.username = "sergio";
  home.homeDirectory = "/home/sergio";

  # Let home manager manage itself
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List of packages
  home.packages =

    # Shared packages
    dev_packages ++
    wm_packages ++

    # WM packages (we are using Hyprland)
    [
      # We customize waybar, otherwise workspaces won't be displayed
      (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))

      pkgs.swaybg # feh replacement for wayland (set the background)
      pkgs.wdisplays # arandr replacement for wayland
      pkgs.cliphist # Clipboard manager
      pkgs.wl-clipboard # Needed for clipboards to work!
      pkgs.wireplumber # For screen sharing
      pkgs.grim # For taking screenshots
      pkgs.slurp # For taking screenshots
      pkgs.pavucontrol # For managing audio

      # Controlling screen brightness
      pkgs.brightnessctl
      pkgs.gammastep

      # Support for QT in Wayland
      pkgs.libsForQt5.qt5.qtwayland # QT support for wayland
      pkgs.qt6.qtwayland # QT support for wayland
    ] ++

    # Messaging
    [
      pkgs.tdesktop
      # TODO -- remove -- this is not a messaging app
      pkgs.unetbootin
    ] ++

    # Fonts
    [
      # Font that supports emojis
      pkgs.noto-fonts-emoji

      # Nerd fonts
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.inconsolata
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.caskaydia-mono
    ] ++

    # Desktop packages
    [
      pkgs.calibre
      pkgs.spotify
      pkgs.keepassxc
      pkgs.syncthing
      pkgs.firefox
      pkgs.xournalpp # For writting docs using the HUION tablet
      pkgs.obs-studio # Streaming and recording
      pkgs.obsidian # Notes
      pkgs.vlc # Video client
      pkgs.krita # For some kick drawings
      pkgs.evince # PDF Reader from Ubunut
      pkgs.zathura # PDF Reader for advanced users
      pkgs.shotwell # Useful when viewing a lot of images
      pkgs.mate.engrampa # Working with compressed and zipped files
      pkgs.nautilus # Graphic file explorer
    ]


    ++
    # Nvidia packages
    [
        # Compatibility layer between nvidia and wayland
        pkgs.egl-wayland
    ];


  # Fonts cannot be installed as normal packages
  # We need to specify this to reload font cache
  fonts.fontconfig.enable = true;

  # Declare which chromium extension we are using
  programs.chromium = {
    enable = true;
    extensions = [

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

      # Catppuccin theme
      { id = "olhelnoplefjdmncknfphenjclimckaf"; }

      # Keepass integration for Chrome
      { id = "oboonakemofpalcgghocfoadofidjkkk"; }
    ];

    # Make sure that chromium works nice in hyprland
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };

  # In hyprland lxappearence is not working, so this way we can configure
  # the looking of our system
  gtk = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font Mono";
      package = null;
      size = 12;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "mocha";
      };
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 16;
    };
  };

  # Configure QT under hyprland window manager
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
}
