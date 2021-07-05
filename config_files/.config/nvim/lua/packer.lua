-- Manage plugins using Packer
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- General purpose
    -- ===============================================================================
    use 'scrooloose/nerdtree'          -- File exploring
    use 'tpope/vim-fugitive'           -- Git Integration
    use 'psliwka/vim-smoothie'         -- Smooth scrolling

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

    -- Code autocompletions and other utils
    use {
        'neoclide/coc.nvim',
        branch = "release",
        requires = "fannheyward/telescope-coc.nvim" -- Integrate with telescope
    }

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
    use {"vim-treesitter/nvim-treesitter", run = ':TSUpdate'}

    -- Color schemes
    -- ===============================================================================
    use 'gruvbox-community/gruvbox'    -- Gruvbox Theme updated
    use 'joshdick/onedark.vim'         -- Secondary Theme
end)
