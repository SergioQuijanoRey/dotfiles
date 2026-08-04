return {
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
				extraArgs = { "--", "-W", "clippy::pedantic" },
			},
		},
	},
}
