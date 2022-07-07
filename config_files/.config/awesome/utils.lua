--- Module with util functions

local tags = dofile("/home/sergio/.config/awesome/globals.lua").tags
local awful = require("awful")
local sharedtags = require("sharedtags")

package = {}

-- Move to a given tag, without changing the tag screen
-- That's to say, if the tag is in other screen, go to that screen and focus it
package.goto_tag = function(tag)

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
