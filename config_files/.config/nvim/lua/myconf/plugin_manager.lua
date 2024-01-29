--- Plugin manager
--- We're using lazy.nvim, but that can change over time


--- TODO -- check out this plugins
--- 1. https://github.com/iamcco/markdown-preview.nvim

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

    'tpope/vim-fugitive',      -- Git integration
    'lewis6991/gitsigns.nvim', -- Git signs
    'karb94/neoscroll.nvim',   -- Smooth scrolling
    'jpalardy/vim-slime',      -- Sending lines to a REPL
    'lambdalisue/suda.vim',    -- For sudo writting a file

    -- File exploring
    {
        'nvim-tree/nvim-tree.lua',

        dependencies = {
            -- File icons
            'nvim-tree/nvim-web-devicons',
            name = "nvim-web-devicons_nvim-tree"
        }
    },


    -- Register and display keybindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    -- Editor
    -- =========================================================================
    'windwp/nvim-autopairs',   -- Autopairs certain chars as " or [
    'preservim/nerdcommenter', -- Commenting code
    'junegunn/vim-easy-align', -- Align plugin
    'mbbill/undotree',         -- Undo tree

    -- For editing the file system from nvim itself
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Visual
    -- =========================================================================

    'folke/zen-mode.nvim', -- Zen mode

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

    -- Color schemes
    -- ===============================================================================
    'gruvbox-community/gruvbox', -- Gruvbox Theme updated
    'joshdick/onedark.vim',      -- Secondary colorscheme
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
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },

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
        build = ":TSUpdate",
    },

    -- Treesitter for just files
    "IndianBoy42/tree-sitter-just",

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

    -- Linter plugin
    -- Useful when the language server does not have linting
    -- Or when a separate linter is more useful (i.e. python with ruff)
    'mfussenegger/nvim-lint',


    -- Autoformater
    -- With the lsp we can do manual formats, but sometimes we want to
    -- autoformat our code
    -- Also, sometimes we want autoformating without lsp (i.e. isort in python)
    'stevearc/conform.nvim',

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
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-emoji',

            -- This adds pretty icons to the completions source indicator
            'onsails/lspkind.nvim'
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
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
    },

    -- Install LSPs, linters, debuggers, ... really easily
    "williamboman/mason.nvim",

    -- Change selection UI to use telescope
    "nvim-telescope/telescope-ui-select.nvim",

    -- Presentations inside neovim
    -- ===============================================================================
    "sotte/presenting.nvim",

    -- Certain languages support
    -- ===============================================================================
    {
        "LhKipp/nvim-nu",
        config = function()
            require 'nu'.setup {
                use_lsp_features = false,
            }
        end
    }
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
