local setmap = require("myconf.aux").setmap
local setmap_group_name = require("myconf.aux").setmap_group_name
local exec = require("myconf/aux").exec


-- We are going to have two zen mode configurations
-- So the following table is going to be the default config

local base_on_open = function(window)
    -- Wrap lines when entering zen mode.
    exec(':set wrap')

    -- Make wrapping preservecode identation
    exec(':set breakindent')

    -- Don't add a newline in the middle of a word when wrapping
    exec(':set linebreak')

    -- Disable 80 char column line
    vim.opt.colorcolumn = nil
end

-- The default configuration that we are going to use
-- We use a function that returns a table to avoid modifying the same table in
-- multiple places (we could use a deepcopy instead, but this seems more elegant)
local template_config = function()
    return {
        window = {
            backdrop = 1.0,     -- Keep the same color in the background
            width = 0.8,        -- 80% of the width
            options = {
                number = false, -- Disable numbers in zen mode
                foldcolumn = "0",
            },
        },

        on_open = function(window)
            base_on_open(window)
        end,

        -- Run changes when toggling off zen mode
        --
        -- Note that visual modifications done in `on_open` are lost when exiting
        -- zen mode, so no need to manually undoing changes
        on_close = function(window)
        end
    }
end

-- Function that is going to run when triggering the keybinding
-- In this function we configure how the zen mode looks
local custom_zen = function(width_percentage)
    -- Copy the default config and change the width percentage
    local new_config = template_config()
    new_config.window.width = width_percentage

    -- Apply that configuration
    require("zen-mode").toggle(new_config)
end

-- Function to make *"fake presentations"*
-- Our presentation plugins does similar things to this zen mode, but applying
-- conceal level, so do the same here
local fake_presentation = function(width_percentage)
    local new_config = template_config()
    new_config.window.width = width_percentage

    -- Add conceal level to `on_open` handler
    new_config.on_open = function(window)
        base_on_open(window)
        vim.opt.conceallevel = 2
    end

    new_config.on_close = function(window)
        vim.opt.conceallevel = 0
    end

    -- Apply that configuration
    require("zen-mode").toggle(new_config)
end


-- Keybinding that uses our custom configuration
setmap_group_name("<leader>f", "Zen mode")
setmap("n", "<leader>ff", function() custom_zen(0.8) end, {}, "Toggle on and off zen mode, small mode")
setmap("n", "<leader>fF", function() custom_zen(0.90) end, {}, "Toggle on and off zen mode, big mode")
setmap("n", "<leader>fP", function() fake_presentation(0.90) end, {}, "Fake presentation")

-- We are using our `custom_zen` function in other places
local M = {}
M.custom_zen = custom_zen
return M
