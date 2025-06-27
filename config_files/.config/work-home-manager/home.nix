{
  config,
  pkgs,
  stablepkgs,
  ...
}: {
  # Home manager needed info
  home.username = "sergio";
  home.homeDirectory = "/home/sergio";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.packages =
    # Shell experience packages
    [
      pkgs.zellij
      pkgs.zoxide
      pkgs.ranger
      pkgs.yazi
      pkgs.direnv
      pkgs.atuin
      pkgs.starship
      pkgs.ripgrep
      pkgs.television
      pkgs.fd
      pkgs.unzip
      pkgs.xdg-utils
      pkgs.wsl-open
    ]
    ++
    # Dev packages
    [
      pkgs.just
      pkgs.neovim
      pkgs.vscode
      pkgs.trash-cli
      pkgs.bat
      pkgs.lazygit
      pkgs.podman
      pkgs.marksman
      pkgs.delta
      pkgs.cargo
      pkgs.duckdb
      pkgs.uv
    ]
    ++
    # System packages
    [
      stablepkgs.nushell
      pkgs.bottom
      pkgs.sqlite
      pkgs.mate.engrampa
      pkgs.duf
      pkgs.du-dust
      pkgs.gcc
      pkgs.speedtest-cli
    ]
    ++
    # Desktop packages
    [
      pkgs.filezilla
      pkgs.zathura
      pkgs.obsidian
    ]
    ++
    # Document writing
    [
      stablepkgs.typst
      stablepkgs.typstfmt
      stablepkgs.typst-lsp
      pkgs.pandoc
    ]
    ++
    # Lib packages
    [
      pkgs.glibc
      pkgs.libcxx
    ]
    ++
    # Language LSPs
    [
      pkgs.nixd
      pkgs.mypy
      pkgs.lua-language-server
      pkgs.tinymist
    ]
    ++
    # Code formatters
    [
      pkgs.alejandra
      pkgs.sleek
      pkgs.stylua
      pkgs.ruff
    ];
}
