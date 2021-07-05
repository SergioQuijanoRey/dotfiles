-- Enable treesitter hightlighting
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing

  -- Highlight feature
  highlight = {
    enable = true,
    disable = {}, -- list of languages not to use hightlighting
  },

  -- Indent feature
  indent = {
    enable = true,
    disable = {"python"} -- Python indentation is not working well
  },
}

-- Enable treesitter identation
require'nvim-treesitter.configs'.setup {
}
