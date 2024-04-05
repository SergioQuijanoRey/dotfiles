--- Configuration of the packages that we want in neovim
return {

    -- General purpose
    -- =========================================================================

    'karb94/neoscroll.nvim', -- Smooth scrolling
    'jpalardy/vim-slime',    -- Sending lines to a REPL
    'lambdalisue/suda.vim',  -- For sudo writting a file



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
            { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },

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
    },

    -- Markdown preview
    -- ===============================================================================
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
}
