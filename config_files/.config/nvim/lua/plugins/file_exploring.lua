local setmap = require("myconf.aux").setmap
local setmap_group_name = require("myconf.aux").setmap_group_name

return {
    -- For editing the file system from nvim itself
    {
        'stevearc/oil.nvim',
        opts = {
            delete_to_trash = true,
            show_hidden = true,

            -- Use Oil instead of netrw
            default_file_explorer = true,
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function(_, opts)
            local oil = require("oil")
            oil.setup(opts)

            -- File tree manipulation
            setmap_group_name("<leader>o", "File tree management")
            setmap("n", "<leader>oo", ":Oil<CR>", {}, "Oil file manager")
            setmap("n", "<leader>of", oil.toggle_float, {}, "Oil file manager floating window")
            setmap("n", "<leader>oO", ":NvimTreeToggle<CR>", {}, "Nvim tree")
            setmap("n", "<leader>-", ":Oil .<CR>", {}, "Oil file manager")
        end
    },

    -- Classic file tree
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            -- File icons
            'nvim-tree/nvim-web-devicons',
            name = "nvim-web-devicons_nvim-tree"
        },
        opts = {
            view = {
                float = {
                    enable = true,
                    quit_on_focus_loss = true,
                    open_win_config = {
                        relative = "editor",
                        border = "rounded",
                        width = 40,
                        height = 40,
                        row = 1,
                        col = 1,
                    },
                },
            },
        }
    },
}
