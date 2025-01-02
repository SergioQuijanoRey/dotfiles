# List of the dev and system packages that we want to have installed in all of our systems
{ pkgs, latestpkgs, ... }:

let
  # Specify custom Python enviroment
  # `pp` is the passed python packages object
  custom_python_packages = pp: [
    pp.numpy
    pp.pytest
  ];
  custom_python_enviroment = pkgs.python310.withPackages custom_python_packages;

in

# Terminal emulators and shells
[
  latestpkgs.wezterm # Preferred terminal
  latestpkgs.ghostty # New terminal
  pkgs.alacritty # Fallback terminal
  pkgs.kitty # Another fallback terminal
  pkgs.nushell # Alternative to zsh and bash
] ++

# Dev packages
[
  latestpkgs.neovim # Main editor
  latestpkgs.zellij # Good alternative for zellij

  pkgs.tree-sitter # Neovim relies heavily on treesitter
  pkgs.tmux # Terminal multiplexer
  pkgs.ripgrep # Better grep
  pkgs.just # Better version of makefile
  pkgs.rsync # Sync files among machines or inside the same machine
  pkgs.act # Run github actions locally
  pkgs.entr # Run automatically commands when some file changes
  pkgs.jq # Command line JSON pretty printer
  pkgs.lldb # For debugging rust and c++ with nvim-dap
  pkgs.fzf # Searching and piping in the terminal
  pkgs.rclone # For syncing with google drive
  pkgs.git # VCS
  pkgs.lazygit # Useful for interacting with git without neovim
  pkgs.pandoc # Tools like rmarkdown need this
  pkgs.sqlite # Database engine that I use in some backends
] ++

# CLI apps
[
  latestpkgs.yazi # Alternative to ranger

  pkgs.zoxide # Better cd command
  pkgs.ranger # CLI file manager
  pkgs.atuin # Better shell history
  pkgs.loc # Display lines of code
  pkgs.timer # To have a TUI timer for my pomodoro sessions
  pkgs.neofetch # Display some system info in the terminal
  pkgs.yt-dlp # Download music. Original `youtube-dl` is not working
  pkgs.trash-cli # To have a trash-like behaviour in the command line
  pkgs.htop # Monitoring tool
  pkgs.bottom # A better top alternative - like gotop but using rust
  pkgs.bat # Better cat alternative
  pkgs.eza # Good replacement for ls and tree (exa -T)
  pkgs.fd # Good replacement for find
  pkgs.sd # Friendly alternative to sed
  pkgs.xh # Good alternative to curl
  pkgs.taskwarrior # For managing tasks through the terminal
  pkgs.vit # CLI Frontend for taskwarrior

  pkgs.duf # Show how hard drives are used
  pkgs.du-dust # Show disk usage of specific dir
  pkgs.ncdu # To explore directories that take too much space
] ++

# System packages
[
  pkgs.w3m # For displaying images in ranger
  pkgs.wget # A lot of tools rely on this package for downloading files
  pkgs.starship # To configure terminal prompt
  pkgs.sshfs # To code on servers with local editors
  pkgs.docker # Container technology
  pkgs.docker-compose # Really simple docker orchestration
  pkgs.xclip # Sharing system and nvim clipboard
  pkgs.ntfs3g # Mounting hdd with ntfs file format
  pkgs.nodePackages.npm # Some programns need this to build
  pkgs.nodejs # Some nvim LSPs need this
  pkgs.zip # To archive files
  pkgs.unzip # Some nvim LSPs need this to install
  pkgs.patchelf # To work with mason.nvim
  pkgs.jmtpfs # Accessing Android devices
  pkgs.gcc
] ++

  # Programming languages tooling
[
  custom_python_enviroment
  pkgs.cargo
  pkgs.ruff
  pkgs.nixd
  pkgs.sumneko-lua-language-server
  pkgs.lua53Packages.lua-lsp
  pkgs.julia-bin
  pkgs.texlab
  pkgs.marksman # Markdown lsp that works well with Obsidian
]
