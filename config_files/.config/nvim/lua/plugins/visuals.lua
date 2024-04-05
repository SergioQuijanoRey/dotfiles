return {

    -- General visual plugins
    'lukas-reineke/indent-blankline.nvim', -- Identation guidelines

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
