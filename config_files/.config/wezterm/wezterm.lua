local wezterm = require 'wezterm'

return {
    color_scheme = "Catppuccin Frappe",
    launch_menu = {},
    hide_tab_bar_if_only_one_tab = true,
    font = wezterm.font(
        "CaskaydiaCove Nerd Font",
        {
            italic = false,
            style = "Normal",
            weight = "DemiBold",
            stretch = "Normal",
        }
    ),
    font_size = 11,

    -- It is annoying when closing a runnin terminal that is using a multiplexer
    -- so we now the contents are not going to be lost
    window_close_confirmation = "NeverPrompt",

    -- When typing a password, show a lock icon
    -- This does not work when using Zellij or Tmux :(
    detect_password_input = true,

    -- NOTE
    -- There is a bug with wezterm in wayland, issued: https://github.com/wez/wezterm/issues/4483
    -- This is a quickfix that will need to be removed
    enable_wayland = false,
}
