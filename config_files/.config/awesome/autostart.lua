--- Programs that I want to execute on starts

local awful = require("awful")

-- Applets
awful.spawn("nm-applet")
awful.spawn("blueman-applet")

-- Set the wallpaper
awful.spawn("feh --bg-scale '/home/sergio/backgrounds/color_penguin.jpg'")

-- Polybar
awful.spawn("/home/sergio/.config/polybar/launcher")

-- Set the screens
awful.spawn("autodisplay")
