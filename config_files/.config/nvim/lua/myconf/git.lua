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
})
