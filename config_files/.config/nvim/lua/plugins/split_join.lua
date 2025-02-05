return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})

		-- Configure the keybindings I want to use
		local setmap = require("myconf/aux").setmap
		local setmap_group_name = require("myconf/aux").setmap_group_name
		local nvim_exec = require("myconf/aux").exec

		setmap_group_name("<leader>j", "Split join commands")
		setmap("n", "<leader>js", require("treesj").split, {}, "Split the code")
		setmap("n", "<leader>jt", require("treesj").toggle, {}, "Toggle split / join")
		setmap("n", "<leader>jj", require("treesj").join, {}, "Join the code")
	end,
}
