return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			presets = {
				-- This presets are too much for me
				-- I know pretty well this vim default bindings
				operators = false,
				motions = false,

				-- I also know this bindings but are more useful to show
				-- Also I don't use them as much as the disabled ones
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		-- Helix windows
		preset = "helix",

		-- Put the popup window in the left and make it bigger
		win = {
			height = { min = 20, max = math.huge },
			row = math.huge,
			col = 0,
		},
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local root = vim.fn.stdpath("data") .. "/lazy"
	end,
}
