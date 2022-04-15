--- Module with util functions

local tags = dofile("/home/sergio/.config/awesome/globals.lua").tags
local awful = require("awful")
local sharedtags = require("sharedtags")

package = {}

package.goto_tag = function(i)
    -- The tag we want to go
    local tag = tags[i]

    -- The screen the tag is in
    -- This way, we can go to that screen
    local screen = tag.screen

    if tag then
        -- View this tag in the screen is laying
        -- Thus, no changing the screen where the tag was
        sharedtags.viewonly(tag, screen)

        -- Focus that screen, so the mouse is over that screen
        awful.screen.focus(screen)
    end

end

return package
