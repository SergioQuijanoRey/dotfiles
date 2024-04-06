-- Telescope
return {
    -- Main plugin
    'nvim-telescope/telescope.nvim',
    lazy = false,

    -- Requirements for telescope in order to run properly
    dependencies = {
        -- Base code requirements
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },

        -- Nice icons for telescope display
        {
            'kyazdani42/nvim-web-devicons',
            name = "nvim-web-devincons_telescope"
        },


        -- Change selection UI to use telescope
        "nvim-telescope/telescope-ui-select.nvim",
    },


    config = function(opts)
        local telescope = require("telescope")
        local telescopeConfig = require("telescope.config")

        -- Construct the arguments to make live grep search also in hidden files
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) } -- Copy default arguments
        table.insert(vimgrep_arguments, "--hidden")                                    -- Search in hidden files
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")                                  -- But don't search in .git folder

        -- We are dinamically modifying this table, and thus, cannot be defined
        -- as `opts` like in other lazy plugin configs
        opts = {
            defaults = {
                -- We are using the default sorter, that now works better than the rest
                file_sorter = require 'telescope.sorters'.get_fuzzy_file,

                -- Live grep also searches in hidden files (dotfiles in Unix)
                vimgrep_arguments = vimgrep_arguments,
            },


            pickers = {
                -- Find files also in hidden files (dotfiles in Unix)
                find_files = {
                    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },

            extensions = {
                -- Nvim Choices using telescope
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown()
                }
            },

        }
        -- Apply the config dict that we get from `opts`
        telescope.setup(opts)

        -- Load the extensions into lua
        telescope.load_extension("ui-select")
    end
}
