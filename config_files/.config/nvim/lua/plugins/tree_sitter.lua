return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function(_, opts)
        -- Make sure this treesitter grammars are always installed
        require('nvim-treesitter').install {
            "lua",
            "just",
            "rust",
            "python",
            "bash",
            "comment",
            "markdown",
            "markdown_inline",
        }

        -- Enable format using treesitter for all filetypes
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function() vim.treesitter.start() end,
        })

        -- Enable identation based on treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
}
