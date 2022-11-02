{ config, pkgs, lib, ... }:

let

    # Custom channels
    # nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl
    nixgl = import <nixgl> {};

in

{
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "sergio";
    home.homeDirectory = "/home/sergio";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    home.packages =

    # Dev packages
    [

        pkgs.neovim             # Main editor
            pkgs.tree-sitter    # Neovim relies heavily on treesitter
            pkgs.zig            # Avoid nvim treesitter fails

        pkgs.tmux       # Terminal multiplexer
        pkgs.ripgrep    # Better grep
        pkgs.just       # Better version of makefile
        pkgs.act        # Run github actions locally
        pkgs.entr       # Run automatically commands when some file changes
        pkgs.jq         # Command line JSON pretty printer
        pkgs.lldb       # For debugging rust and c++ with nvim-dap
        pkgs.fzf        # Searching and piping in the terminal
        pkgs.rclone     # For syncing with google drive
    ] ++

    # System packages
    [
        pkgs.zsh        # Shell enviroment
                        # Plugins need to be installed through normal package manager in order
                        # to be put in /usr/share/...

        pkgs.zoxide     # Better cd command
        pkgs.ranger     # CLI file manager
            pkgs.w3m        # For displaying images in ranger
        pkgs.starship   # To configure terminal prompt
        pkgs.bottom     # A better top alternative - like gotop but using rust
        pkgs.bat        # Better cat alternative
        pkgs.duf        # For seeing disk usage
        pkgs.rar        # To extract winrar files
        pkgs.exa        # Good replacement for ls and tree (exa -T)
        pkgs.fd         # Good replacement for find

    ] ++

    # Videogames packages
    [
        pkgs.openspades
        nixgl.auto.nixGLDefault
    ];


    # Packages that have unfree license
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "rar"
    ];


    programs.zsh = {
      plugins = [
        {
          # will source zsh-autosuggestions.plugin.zsh
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.4.0";
            sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
          };
        }

      ];
    };
}
