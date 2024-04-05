return {
    'gruvbox-community/gruvbox', -- Gruvbox Theme updated
    'joshdick/onedark.vim',      -- Secondary colorscheme
    'endel/vim-github-colorscheme',
    'YorickPeterse/vim-paper',

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
