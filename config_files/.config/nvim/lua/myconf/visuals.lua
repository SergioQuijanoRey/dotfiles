-- Config file for some visual settings

-- Basic neovim visual settings
vim.opt.number = true               -- Show numbers
vim.opt.hlsearch = true             -- Higlights what we searched
vim.opt.wrap = false                -- Don't wrap long lines
vim.opt.listchars.extends=→         -- Show arrow if line continues rightwards
vim.opt.colorcolumn={80}            -- Show column line
vim.opt.guicursor = ""              -- Block cursor
vim.optloaded_matchparen = 1        -- No matching parenthesis/brakets/... highlight
vim.opt.termguicolors = true        -- Colorschemes dont work well without this
vim.opt.background="dark"           -- Dark background, does nothing with gruvbox colorscheme

-- Set the colorscheme
local catppuccin = require("catppuccin")
catppuccin.setup({
    flavour = "frappe",
    integrations = {
        markdown = false,
    }
})
vim.api.nvim_command "colorscheme catppuccin-frappe"

-- Use noice to enhance NeoVIM UI
require("noice").setup({
    -- you can enable a preset for easier configuration
    presets = {
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
    },

    -- Don't collide with our lsp configuration
    lsp = {
        signature = {
            enabled = false
        },
    },

    -- I like the new command line popup
    -- But I want it in the lower-left corner
    -- This also affects the search popup!, which I like
    views = {
        cmdline_popup = {
            position = {
                row = "100%",
                col = "0%",
            }
        }
    }
})
