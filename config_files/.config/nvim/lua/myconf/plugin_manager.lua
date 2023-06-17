--- Plugin manager
--- We're using lazy.nvim, but that can change over time

--- Install lazy.nvim if it is not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--- Configuration of the packages that we want in neovim
local package_conf = {

    -- General purpose
    -- =========================================================================

    'tpope/vim-fugitive',           -- Git integration
    'lewis6991/gitsigns.nvim',      -- Git signs
    'karb94/neoscroll.nvim',        -- Smooth scrolling
    'jpalardy/vim-slime',           -- Sending lines to a REPL
    'lambdalisue/suda.vim',         -- For sudo writting a file

    -- File exploring
    {
        'nvim-tree/nvim-tree.lua',

        dependencies = {
            -- File icons
            'nvim-tree/nvim-web-devicons',
            name = "nvim-web-devicons_nvim-tree"
        }
    },

    -- Editor
    -- =========================================================================
    'windwp/nvim-autopairs',             -- Autopairs certain chars as " or [
    'preservim/nerdcommenter',           -- Commenting code
    'junegunn/vim-easy-align',           -- Align plugin

    -- Visual
    -- =========================================================================

    'junegunn/goyo.vim',  -- Focus mode

    -- Display status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            name = "nvim-web-devicons_lualine"
        }
    },

    -- Show indentation guidelines
    'lukas-reineke/indent-blankline.nvim',

    -- Change commands and outputs with nice views
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",

            -- This is the plugin that adds the proper views
            -- noice.nvim just adds better behavior on top of this plugin
            "rcarriga/nvim-notify",
        }
    },

    -- Color schemes
    -- ===============================================================================
    'gruvbox-community/gruvbox',     -- Gruvbox Theme updated
    'joshdick/onedark.vim',          -- Secondary colorscheme
    'endel/vim-github-colorscheme',
    'YorickPeterse/vim-paper',

    -- Good pastel palette
    {
        'catppuccin/nvim',
        name = "catppuccin"
    },

    -- Language server protocols, codecompletions, ...
    -- ===============================================================================

    -- Telescope
    {
        -- Main plugin
        'nvim-telescope/telescope.nvim',

        -- Requirements for telescope in order to run properly
        dependencies = {
            -- Base code requirements
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},

            -- Nice icons for telescope display
            {
                'kyazdani42/nvim-web-devicons',
                name = "nvim-web-devincons_telescope"
            }
        }

    },

    -- Treesitter -- Advance hightlighting and other capabilities
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        cmd = 'TSUpdate',
    },

    -- Treesitter for just files
    "IndianBoy42/tree-sitter-just",


    -- Manages installation of LSPs, linters, DAPs...
    {
        "williamboman/mason.nvim",

        dependencies = {
            -- Adapter to use both mason and lspconfig
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }
    },

    -- Builtin lsp
    {
        -- Main plugin
        "neovim/nvim-lspconfig",

        -- Dependencies for the plugin
        dependencies = {

            -- Signature hint plugin
            "ray-x/lsp_signature.nvim",
        }
    },

    -- Linter snippet
    -- Useful when the language server does not have linting
    -- Or when a separate linter is more useful (i.e. python with ruff)
    'mfussenegger/nvim-lint',

    -- Completion engine
    -- Note that nivm-lsp does not have a completion engine by default
    {
        -- Main plugin
        'hrsh7th/nvim-cmp',

        -- Aux plugins for nvim-cmp
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp'
        }
    },

    -- Snipet plugin. I use it almost exlusively for nvim-cmp
    {
        'L3MON4D3/LuaSnip',

        dependencies = {
            -- For having autocompletion of the snippets trigger keywords
            'saadparwaiz1/cmp_luasnip'
        }

    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",

        dependencies = {
            -- UI for debugging
            "rcarriga/nvim-dap-ui",

            -- Virtual text for debugging sessions
            "theHamsta/nvim-dap-virtual-text",

            -- Having telescope utils
            "nvim-telescope/telescope-dap.nvim",

            -- Plugins for configuring debugging in different languages
            -- We can configure languages ourselves but with this plugins is way easier
            "mfussenegger/nvim-dap-python",
        }
    },

    -- Show a list with all the diagnostics
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            name = "nvim-web-devicons_nvim-tree"
        },
    },

    -- UI for showing the LSP init progress
    "j-hui/fidget.nvim",

    -- Latex to unicode for julia
    "JuliaEditorSupport/julia-vim",

}

--- Options for lazy.nvim
local options = {
    defaults = {
        -- Lazy load. Set to true gives the same behavior as impatient.nvim
        -- But some plugins fail to execute. Plugins that are not lua-like,
        -- and use `:Command` style of invocation
        lazy = false,
    }
}

require("lazy").setup(package_conf, options)
