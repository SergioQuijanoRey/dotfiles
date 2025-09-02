-- Configuration for the bookmarks plugin
require("bookmarks"):setup({
	persist = "all",
	show_keys = true,
})

-- Configuration for the git plugin
require("git"):setup()

-- Configuration for the duckdb plugin
require("duckdb"):setup()
