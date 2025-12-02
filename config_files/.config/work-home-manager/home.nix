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
      pkgs.trash-cli
      pkgs.bat
      pkgs.lazygit
      pkgs.git-graph
      pkgs.difftastic
      pkgs.podman
      pkgs.marksman
      pkgs.delta
      pkgs.cargo
      pkgs.duckdb
      pkgs.uv
      pkgs.devenv
      # Dependencies for neovim plugins
      pkgs.lua54Packages.luarocks # Nvim dap relies on this
    ]
    ++
    # System packages
    [
      stablepkgs.nushell
      pkgs.bottom
      pkgs.sqlite
      pkgs.mate.engrampa
      pkgs.duf
      pkgs.dust
      pkgs.gcc
      pkgs.speedtest-cli
      pkgs.eza
    ]
    ++
    # Desktop packages
    [
      pkgs.zathura
      pkgs.obsidian
      pkgs.dbeaver-bin
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
