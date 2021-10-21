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
    use 'dhruvasagar/vim-table-mode'   -- For writing markdown tables

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

            -- Signature hint plugin
            use {
                "ray-x/lsp_signature.nvim",
                opt = false,
            },
        }
    }

    -- Color schemes
    -- ===============================================================================
    use 'gruvbox-community/gruvbox'    -- Gruvbox Theme updated
    use 'joshdick/onedark.vim'         -- Secondary colorscheme

end)
