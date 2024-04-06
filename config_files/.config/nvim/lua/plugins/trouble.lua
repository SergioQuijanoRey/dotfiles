-- To open list of diagnostics
-- Also, to quickly iterate over quickfix list
return {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        name = "nvim-web-devicons_nvim-tree"
    },
    opts = {
        position = "bottom",
        mode = "workspace_diagnostics",
        auto_open = false,

        -- If true, jumps to other places just by hovering over the trouble list
        auto_preview = true,
    },
}
