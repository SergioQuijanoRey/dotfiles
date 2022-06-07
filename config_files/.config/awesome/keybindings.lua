--- Module where I configure awesome keybindings

local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local sharedtags = require("sharedtags")

-- For the capslock widget, that need to set some vars in globalkeys
local capslock = require("awesome-capslock_widget.capslock")

-- The table we are going to return
package = {}
--
-- Load some globals
modkey = dofile("/home/sergio/.config/awesome/globals.lua").modkey
terminal = dofile("/home/sergio/.config/awesome/globals.lua").terminal
tags = dofile("/home/sergio/.config/awesome/globals.lua").tags
goto_tag = dofile("/home/sergio/.config/awesome/utils.lua").goto_tag


Shift = "Shift"

-- Default global keybindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    awful.key(
        { modkey,}, "Left",
        function()
            awful.client.focus.byidx(-1)
        end,
        {description = "Focus prev by id", group = "client"}
    ),
    awful.key(
        { modkey,}, "Right",
        function()
            awful.client.focus.byidx(1)
        end,
        {description = "Focus next by id", group = "client"}
    ),

    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),


    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "Right", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "Left", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    awful.key({ modkey,           }, "Tab",
    function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Launch terminal
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),

    -- Reload awesome wm
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    -- Resize master
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    -- Control no masters / columns
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    -- Iterate over different layouts
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),


    awful.key(
        {modkey, Shift}, "n",
        function()
            awful.spawn(terminal.." -e tmux-init 'ranger' 'ranger'")
        end,
        {description = "Launch terminal with kitty and ranger", group = "app bindings"}
    ),

    awful.key(
        {modkey, }, "d",
        function()
            -- awful.spawn("rofi -show run -config '/home/sergio/.i3/rofithemes/gruvbox.rasi'")
            awful.spawn("rofi -show drun -config '/home/sergio/.config/rofi/catppuccin.rasi'")
        end,
        {description = "Launch rofi", group = "app bindings"}
    ),


    awful.key(
        {modkey, Shift}, "Return",
        function()
            awful.spawn(terminal .. " -e tmux-init")
        end,
        {description = "Launch terminal with kitty", group = "app bindings"}
    ),

    awful.key(
        {modkey, Shift}, "b",
        function()
            awful.spawn("chromium")
        end,
        {description = "Open web browser", group = "app bindings"}
    ),

    awful.key(
        {modkey, Shift}, "e",
        function()
            awful.spawn("shutdown_menu")
        end,
        {description = "Open shutdown menu", group = "app bindings"}
    ),

    awful.key(
        {modkey,}, "t",
        function()
            awful.spawn("wallpaper")
        end,
        {description = "Rofi selector for wallpapers", group = "app bindings"}
    ),

    -- VOLUME CONTROL
    awful.key({}, "XF86AudioRaiseVolume", function() os.execute("amixer -D pulse sset Master 5%+") end),
    awful.key({}, "XF86AudioLowerVolume", function() os.execute("amixer -D pulse sset Master 5%-") end),
    awful.key({}, "XF86AudioMute", function() os.execute("amixer -D pulse set Master 1+ toggle") end),

    -- MEDIA CONTROLS
    awful.key({}, "XF86AudioPlay", function() os.execute("playerctl play-pause") end),
    awful.key({}, "XF86AudioPause", function() os.execute("playerctl play-pause") end),
    awful.key({}, "XF86AudioNext", function() os.execute("playerctl next") end),
    awful.key({}, "XF86AudioPrev", function() os.execute("playerctl previous") end),


    -- Launch julia REPL as calculator
    awful.key({ modkey, Shift}, "c",
        function (c)
            -- Launch terminal, with tmux initialized in custom session
            awful.spawn(terminal.." -e tmux-init 'calc' 'julia'")
        end,
        {description = "Open a calculator", group = "app bindings"}),

    -- This is required for the capslock widget
    capslock.key
)

-- Default client keybindings
clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),

    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),

    awful.key(
        { modkey, "Shift" }, "m",
        function (c)
            c:swap(awful.client.getmaster())
        end,
        {description = "move to master", group = "client"}
    ),

    awful.key({ modkey,           }, "o",
    function (c) c:move_to_screen() end,
    {description = "move to screen", group = "client"}),


    awful.key({ modkey, "Shift"}, "p",
    function (c)

        -- Select current tag
        local current_tag = awful.screen.focused().selected_tag

        -- If no tag is selected, then do nothing
        if current_tag == nil then return end

        -- Select next screen (to the right)
        -- We asume only two screens
        local curr_screen = c.screen
        local next_screen = curr_screen:get_next_in_direction("right")
        if next_screen == nil then
            next_screen = curr_screen:get_next_in_direction("left")
        end

        -- Move this tag to the other screen
        sharedtags.movetag(current_tag, next_screen)

        -- Move along the tag
        -- awful.screen.focus(next_screen)
        goto_tag(current_tag)


    end,
    {description = "Move tag to the other screen", group = "client"})


    -- TODO -- this is for minimizing / maximizing clients, and now i don't want that
    -- awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
    --           {description = "toggle keep on top", group = "client"}),
    -- awful.key({ modkey,           }, "n",
    --     function (c)
    --         -- The client currently has the input focus, so it cannot be
    --         -- minimized, since minimized clients can't have the focus.
    --         c.minimized = true
    --     end ,
        -- {description = "minimize", group = "client"}),
    -- awful.key({ modkey,           }, "m",
    --     function (c)
    --         c.maximized = not c.maximized
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize", group = "client"})
    -- awful.key({ modkey, "Control" }, "m",
    --     function (c)
    --         c.maximized_vertical = not c.maximized_vertical
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize vertically", group = "client"}:
    -- awful.key({ modkey, "Shift"   }, "m",
    --     function (c)
    --         c.maximized_horizontal = not c.maximized_horizontal
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize horizontally", group = "client"})
)

-- Keybindings for controlling tags
-- We are using shared tags among two screens
-- TODO -- if go to tag 0 and tag 0 is in other screen, first move to that screen and then move to tag
--      -- now we are moving tag 0 to curren screen
for i = 1, 10 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
        function ()
            -- The tag we want to go
            local tag = tags[i]

            -- Custom function to move to that tag
            goto_tag(tag)

        end,
        {description = "view tag #"..i, group = "tag"}),

        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = tags[i]
                      if tag then
                         sharedtags.viewtoggle(tag, screen)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Return globalkeys and clientkeys
-- This way we can use this module in rc.lua using require syntax
package.globalkeys = globalkeys
package.clientkeys = clientkeys

return package
