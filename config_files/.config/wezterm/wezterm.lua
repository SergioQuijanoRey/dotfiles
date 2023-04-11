local wezterm = require 'wezterm'

return {
    color_scheme = "Catppuccin Frappe",
    launch_menu = {},
    hide_tab_bar_if_only_one_tab = true,
    font = wezterm.font(
        "CaskaydiaCove NF Mono",
        {
            -- weight = "Medium",
            weight = "Medium",
            italic = false,
            style = "Normal",
        }
    ),
    font_size = 11,
}
