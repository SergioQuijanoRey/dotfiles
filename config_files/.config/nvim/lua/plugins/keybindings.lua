return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = {
            presets = {
                -- This presets are too much for me
                -- I know pretty well this vim default bindings
                operators = false,
                motions = false,

                -- I also know this bindings but are more useful to show
                -- Also I don't use them as much as the disabled ones
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            }
        },
        -- Helix windows
        preset = "helix",
        win = {
            width = { min = 10, max = 100 },
            height = { min = 50, max = 100 },
        },
    },
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local root = vim.fn.stdpath("data") .. "/lazy"
    end,
}
