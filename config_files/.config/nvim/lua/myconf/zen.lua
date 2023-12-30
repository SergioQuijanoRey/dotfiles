local setmap = require("myconf.aux").setmap
local exec = require("myconf/aux").exec


-- Function that is going to run when triggering the keybinding
-- In this function we configure how the zen mode looks
local custom_zen = function()
    require("zen-mode").toggle({
        window = {
            backdrop = 1.0, -- Keep the same color in the background
            width = 0.95,
            options = {
                number = false, -- Disable numbers in zen mode
                foldcolumn = "0",
            },
        },

        -- Wrap lines when entering zen mode
        on_open = function(window)
            exec(':set wrap linebreak')
            vim.opt.colorcolumn = nil
        end,

        -- Run changes when toggling off zen mode
        --
        -- Note that visual modifications done in `on_open` are lost when exiting
        -- zen mode, so no need to manually undoing changes
        on_close = function()
        end
    })
end


-- Keybinding that uses our custom configuration
setmap("n", "<leader>f", custom_zen, {}, "Toggle on and off zen mode")
