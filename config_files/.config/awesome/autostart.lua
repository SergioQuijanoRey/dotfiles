--- Programs that I want to execute on starts

local awful = require("awful")

-- Applets
awful.spawn("nm-applet")
awful.spawn("blueman-applet")
awful.spawn("kmix")

-- Set the wallpaper
awful.spawn("feh --bg-scale '/home/sergio/backgrounds/color_penguin.jpg'")

-- Set the screens
awful.spawn("autodisplay")
