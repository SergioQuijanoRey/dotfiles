-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
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
})

-- We also use oil nvim for accessing the file system
require("oil").setup({
    delete_to_trash = true,
    show_hidden = true,
})
