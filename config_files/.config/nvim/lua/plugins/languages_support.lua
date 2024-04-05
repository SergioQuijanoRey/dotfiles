--- Plugins that add support to certain languages
return {
    -- Nushell support
    {
        "LhKipp/nvim-nu",
        opts = { use_lsp_features = false },
    },

    -- Treesitter for just files
    { "IndianBoy42/tree-sitter-just", opts = {} },

}
