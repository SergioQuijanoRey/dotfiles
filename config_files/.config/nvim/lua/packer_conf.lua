-- Manage plugins using Packer

return require('packer').startup(function()
    -- General purpose
    -- ===============================================================================
    use 'scrooloose/nerdtree'          -- File exploring
    use 'tpope/vim-fugitive'           -- Git Integration
    use 'psliwka/vim-smoothie'         -- Smooth scrolling
    use 'wbthomason/packer.nvim'       -- Manage the plugin manager

    -- Editor
    -- ===============================================================================
    use 'jiangmiao/auto-pairs'         -- Autoclose brackets, parenthesis...
    use 'preservim/nerdcommenter'      -- Commenting code

    -- Visual
    -- ===============================================================================
    use 'vim-airline/vim-airline'          -- Status bar. Lightline is a lighter alternative
    use 'vim-airline/vim-airline-themes'   -- Status bar themes
    use 'junegunn/goyo.vim'                -- Focus Mode
    use 'ryanoasis/vim-devicons'           -- Icons for NerdTree

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

    -- Treesitter -- Advance hightlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        run = ':TSUpdate'
    }

    -- Builtin lsp
    use {
        -- Main plugin
        "neovim/nvim-lspconfig",

        -- Dependencies for the plugin
        requires = {
            -- Command for installing servers
            "kabouzeid/nvim-lspinstall",

            -- Completion plugin
            "hrsh7th/nvim-compe",
        }
    }

    -- Color schemes
    -- ===============================================================================
    use 'gruvbox-community/gruvbox'    -- Gruvbox Theme updated
    use 'joshdick/onedark.vim'         -- Secondary Theme

end)
