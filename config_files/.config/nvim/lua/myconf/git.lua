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

})
