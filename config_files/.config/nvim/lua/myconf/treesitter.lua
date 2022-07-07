-- Configuration of treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing

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
require'nvim-treesitter.configs'.setup {
}
