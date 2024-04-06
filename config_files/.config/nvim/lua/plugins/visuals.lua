return {

    -- Identation guidelines
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "|",
                },

                -- I don't want to hightlight the scope I am currently at
                scope = { enabled = false },
            })
        end
    },

    -- Good pastel palette
    {
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "frappe",
            integrations = {
                lsp_trouble = true,
                which_key = true
            }
        },
        config = function(opts)
            require("catppuccin").setup(opts)
            vim.api.nvim_command "colorscheme catppuccin-frappe"
        end
    },
}
