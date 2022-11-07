-- Configuration of treesitter
require'nvim-treesitter.configs'.setup {
  -- All can be used to install all mantained languages
  -- Bad idea because it will install approx 127 langs and might crash the computer
  ensure_installed = {
    "lua",
    "rust",
    "python",
    "bash",
  }, 

  ignore_install = {}, -- List of parsers to ignore installing

  -- Install the lang we are editing if not installed yet
  auto_install = true,

  -- Highlight feature
  highlight = {
    enable = true,
    disable = {}, -- list of languages not to use hightlighting
  },

  -- Indent feature
  indent = {
    enable = false,              -- TODO -- indentation never works well, check in a few months
    disable = {}
  },
}

-- Enable treesitter identation
require'nvim-treesitter.configs'.setup {}

-- This is required when using nvim installed with nix package manager
-- require 'nvim-treesitter.install'.compilers = { 'zig' }
