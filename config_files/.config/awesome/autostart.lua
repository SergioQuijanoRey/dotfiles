--- Programs that I want to execute on starts

local awful = require("awful")

-- Applets
awful.spawn("nm-applet")
awful.spawn("blueman-applet")
awful.spawn("kmix")

-- Set the wallpaper
wallpaper = dofile("/home/sergio/.config/awesome/globals.lua").wallpaper
awful.spawn("feh --bg-scale '" .. wallpaper .. "'")

-- Set the screens
awful.spawn("autodisplay")

-- Other programs
awful.spawn("telegram-desktop")
