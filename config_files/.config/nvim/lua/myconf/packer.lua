-- Manage plugins using Packer

-- Install packer if its not installed yet
function install_if_not_installed()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd 'packadd packer.nvim'
    end
end
install_if_not_installed()

--- Packages we are using
return require('packer').startup(function()
    -- General purpose
    -- ===============================================================================
    use 'tpope/vim-fugitive'           -- Git Integration
    use 'psliwka/vim-smoothie'         -- Smooth scrolling
    use 'wbthomason/packer.nvim'       -- Manage the plugin manager
    use 'jpalardy/vim-slime'           -- Sending lines to a REPL
    use 'lambdalisue/suda.vim'         -- For sudo writting a file
    use 'lewis6991/impatient.nvim'     -- Speed up startup time

    -- File exploring
    use {
        'nvim-tree/nvim-tree.lua',

        requires = {
            -- File icons
            'nvim-tree/nvim-web-devicons',
        }
    }

    -- Editor
    -- ===============================================================================
    use 'windwp/nvim-autopairs'             -- Autopairs certain chars as " or [
    use 'preservim/nerdcommenter'           -- Commenting code
    use 'dhruvasagar/vim-table-mode'        -- For writing markdown tables

    -- Visual
    -- ===============================================================================
    use 'junegunn/goyo.vim'                -- Focus Mode

    -- Display status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    -- Show indentation guidelines
    use 'lukas-reineke/indent-blankline.nvim'

    -- Color schemes
    -- ===============================================================================
    use 'gruvbox-community/gruvbox'     -- Gruvbox Theme updated
    use 'joshdick/onedark.vim'          -- Secondary colorscheme
    use 'endel/vim-github-colorscheme'
    use 'YorickPeterse/vim-paper'

    -- Good pastel palette
    use({
        'catppuccin/nvim',
        as = "catppuccin"
    })

    -- Language server protocols, codecompletions, ...
    -- ===============================================================================

    -- Telescope
    use {
        -- Main plugin
        'nvim-telescope/telescope.nvim',

        -- Requirements for telescope in order to run properly
        requires = {
            -- Base code requirements
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},

            -- Nice icons for telescope display
            {'kyazdani42/nvim-web-devicons'}
        }

    }

    -- Treesitter -- Advance hightlighting and other capabilities
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        run = ':TSUpdate'
    }

    -- Treesitter for just files
    use "IndianBoy42/tree-sitter-just"


    -- Manages installation of LSPs, linters, DAPs...
    use {
        "williamboman/mason.nvim",

        requires = {
            -- Adapter to use both mason and lspconfig
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }
    }

    -- Builtin lsp
    use {
        -- Main plugin
        "neovim/nvim-lspconfig",

        -- Dependencies for the plugin
        requires = {

            -- Signature hint plugin
            use {
                "ray-x/lsp_signature.nvim",
                opt = false,
            },
        }
    }

    -- Linter snippet
    -- Useful when the language server does not have linting
    -- Or when a separate linter is more useful (i.e. python with ruff)
    use 'mfussenegger/nvim-lint'

    -- Completion engine
    -- Note that nivm-lsp does not have a completion engine by default
    use {
        -- Main plugin
        'hrsh7th/nvim-cmp',

        -- Aux plugins for nvim-cmp
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp'
        }
    }

    -- Snipet plugin. I use it almost exlusively for nvim-cmp
    use {
        'L3MON4D3/LuaSnip',

        requires = {
            -- For having autocompletion of the snippets trigger keywords
            'saadparwaiz1/cmp_luasnip'
        }

    }

    -- Debugging
    use {
        "mfussenegger/nvim-dap",

        requires = {
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
    }

    -- UI for showing the LSP init progress
    use "j-hui/fidget.nvim"

    -- Latex to unicode for julia
    use {"JuliaEditorSupport/julia-vim"}
end)
