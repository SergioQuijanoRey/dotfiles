local setmap = require("myconf.aux").setmap
local setmap_group_name = require("myconf.aux").setmap_group_name

return {
    -- Git signs
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local opts = {
                signs = {
                    add          = { text = '│' },
                    change       = { text = '│' },
                    delete       = { text = '-' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
            }
            require("gitsigns").setup(opts)

            setmap_group_name("<leader>g", "Git")
            setmap('n', '<leader>gi', ":Gitsign toggle_signs<CR>", {}, "Toggle git signs")
        end
    },

    -- Neogit + Diffview
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim",
            "nvim-lua/plenary.nvim",
        },
        opts = {
            -- This makes some parts look better
            graph_style = "unicode",

            -- Open neogit "popups" in split mode by default, instead of tab mode
            -- Vertical or horizontal split are chosen automatically
            kind = "auto",

            -- I don't like this visuals
            disable_context_highlighting = true,

            -- I want to open the commit editor in normal mode instead of insert mode
            disable_insert_on_commit = true,

            integrations = {
                telescope = "true",
                diffview = "true",
            },

            -- I want to be able to use "w" and "b" for navigating    -- I want to be able to use "w" and "b" for navigating    -- I want to be able to use "w" and "b" for navigating    -- I want to be able to use "w" and "b" for navigating
            -- So change these sortcuts to "Shift-w" and "Shift-b"
            mappings = {
                popup = {
                    -- Disable default mappings
                    ["w"] = false,
                    ["b"] = false,

                    -- And set them with new things
                    ["W"] = "WorktreePopup",
                    ["B"] = "BranchPopup",

                },
            },

            -- Better visual chars
            signs = {
                -- { CLOSED, OPENED }
                hunk = { "󱞩", "" },
                item = { "󱞩", "󰁅" },
                section = { "󱞩", "󰁅" },
            },

            -- Configure the commit message view
            -- I want it to be opened in a vsplit, with the diff opened below in
            -- an horizontal split
            commit_editor = {
                kind = "vsplit",
                show_staged_diff = true,
                staged_diff_split_kind = "split"
            },
        },
        config = function(_, opts)
            require("neogit").setup(opts)

            -- Git integrations
            setmap_group_name("<leader>g", "Git")
            setmap("n", "<leader>gg", ":Neogit kind=tab<CR>", {}, "Open git status in a new tab")
            setmap("n", "<leader>gG", ":Neogit kind=auto<CR>", {}, "Open git status in a split")
            setmap('n', '<leader>gi', ":Gitsign toggle_signs<CR>", {}, "Toggle git signs")
        end
    },
}
