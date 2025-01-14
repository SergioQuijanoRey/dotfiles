return {
	{
		"saghen/blink.cmp",
		dependencies = {
			-- We are going to autocomplete the snippets that LuaSnip manages
			"L3MON4D3/LuaSnip",
		},
		-- use a release tag to download pre-built binaries
		version = "v0.*",
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = { preset = "enter" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- optionally disable cmdline completions
				-- cmdline = {},
				min_keyword_length = 3,
			},

			snippets = { preset = "luasnip" },
			signature = { enabled = true },
		},
	},
}
