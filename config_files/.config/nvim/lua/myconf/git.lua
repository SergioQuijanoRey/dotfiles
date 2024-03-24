-- Configs associated with git

-- Git signs
-- =============================================================================
require('gitsigns').setup {
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '-' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
}

-- Neogit
-- =============================================================================
require('neogit').setup({
    graph_style = "ascii",
    kind = "auto",
    integrations = {
        telescope = "true",
        diffview = "true",
    },

    -- I want to be able to use "w" and "b" for navigating
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
})
