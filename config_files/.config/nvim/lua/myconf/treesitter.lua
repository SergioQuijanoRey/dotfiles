-- Configuration of treesitter
require 'nvim-treesitter.configs'.setup {
    -- All can be used to install all mantained languages
    -- Bad idea because it will install approx 127 langs and might crash the computer
    ensure_installed = {
        "lua",
        "rust",
        "python",
        "bash",
        "comment",
        "markdown",
        "markdown_inline"
    },

    ignore_install = {}, -- List of parsers to ignore installing

    -- Install the lang we are editing if not installed yet
    auto_install = true,

    -- Highlight feature
    highlight = {
        enable = true,
        disable = {},
    },

    -- Indent feature
    indent = {
        enable = true,
        disable = {}
    },
}

-- Enable treesitter identation
require 'nvim-treesitter.configs'.setup {}

-- Add tree sitter grammar for justfiles
require("tree-sitter-just").setup({})
