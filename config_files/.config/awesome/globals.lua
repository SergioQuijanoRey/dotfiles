--- Globals that are used in more than one file of the config (ie. modkey)


package = {}

local sharedtags = require("sharedtags")
local awful = require("awful")

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
package.modkey = "Mod4"
package.terminal = "kitty"
--
-- Shared tags among two screens
package.tags = sharedtags({
    {name = "1: ", layout = awful.layout.layouts[1]},
    {name = "2: ", layout = awful.layout.layouts[1]},
    {name = "3: ", layout = awful.layout.layouts[1]},
    {name = "4: ", layout = awful.layout.layouts[1]},
    {name = "5: ", layout = awful.layout.layouts[1]},
    {name = "6: ", layout = awful.layout.layouts[1]},
    {name = "7", layout = awful.layout.layouts[1]},
    {name = "8", layout = awful.layout.layouts[1]},
    {name = "9: ", layout = awful.layout.layouts[1]},
    {name = "10: ", layout = awful.layout.layouts[1]},
})

package.wallpaper = "/home/sergio/backgrounds/hollow_clean.png"

return package
