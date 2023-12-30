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
            }
        },

        -- Wrap lines when entering zen mode
        on_open = function(window)
            exec(':set wrap linebreak')
        end,

        -- Unwrap lines when exiting zen mode
        on_close = function()
            exec(':set nowrap')
        end
    })
end


-- Keybinding that uses our custom configuration
setmap("n", "<leader>f", custom_zen, {}, "Toggle on and off zen mode")
