--- Programs that I want to execute on starts

local awful = require("awful")

package = {}

--- Function that autostarts all the programs
--- This way, we can call this function at the end of the config, because it relies on
--- tags already spawned
package.autostart = function ()
    -- Applets
    awful.spawn("nm-applet")
    awful.spawn("blueman-applet")

    -- Set the wallpaper
    wallpaper = dofile("/home/sergio/.config/awesome/globals.lua").wallpaper
    awful.spawn("feh --bg-scale '" .. wallpaper .. "'")

    -- Set the screens
    awful.spawn("autodisplay")

    -- Other programs
    awful.spawn("telegram-desktop")

end


return package
