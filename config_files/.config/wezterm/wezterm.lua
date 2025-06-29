local wezterm = require("wezterm")
local mux = wezterm.mux

local IS_WSL = true

if IS_WSL then
	wezterm.on("gui-startup", function()
		local _, first_pane, window = mux.spawn_window({
			args = {
				"C:\\Users\\squijanr\\OneDrive - NTT DATA EMEAL\\Desktop\\kanata\\kanata.exe",
				"--cfg",
				"C:\\Users\\squijanr\\OneDrive - NTT DATA EMEAL\\Desktop\\kanata\\kanata.kbd",
			},
		})

		local _, _, _ = window:spawn_tab({ args = { "wsl" } })
	end)
end

return {
	color_scheme = "Catppuccin Frappe",
	launch_menu = {},
	-- hide_tab_bar_if_only_one_tab = true,
	enable_tab_bar = false,

	font = wezterm.font_with_fallback({
		{
			family = "CaskaydiaCove Nerd Font",
			italic = false,
			style = "Normal",
			weight = "DemiBold",
			stretch = "Normal",
		},

		{ family = "JetBrains Mono", weight = "Medium" },
	}),
	font_size = 12,

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
