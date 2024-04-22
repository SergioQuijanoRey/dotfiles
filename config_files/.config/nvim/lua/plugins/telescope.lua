local setmap = require("myconf/aux").setmap
local setmap_group_name = require("myconf/aux").setmap_group_name

-- Telescope
return {
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
        },


        -- Change selection UI to use telescope
        "nvim-telescope/telescope-ui-select.nvim",
    },


    config = function()
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

        -- Setup some mappings
        setmap_group_name("<leader>l", "Telescope")
        setmap("n", "<leader>p", "<cmd>Telescope find_files<cr>", { noremap = true }, "Telescope find files")
        setmap("n", "<leader>ll", "<cmd>Telescope<CR>", { noremap = true }, "All telescope options")
        setmap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { noremap = true }, "Live grep")
        setmap("n", "<leader>lb", "<cmd>Telescope buffers<cr>", { noremap = true }, "Buffers")
        setmap("n", "<leader>lf", "<cmd>Telescope filetypes<cr>", { noremap = true }, "Filetypes")
        setmap("n", "<leader>l/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = true },
            "Current buffer fuzzy find")
        setmap("n", "<leader>ld", "<cmd>Telescope diagnostics<cr>", { noremap = true }, "Diagnostics")
        setmap("n", "<leader>lr", "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true }, "LSP Document symbols")
    end
}
