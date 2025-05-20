return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{
				"tpope/vim-dadbod",
				lazy = true,
			},
			{
				"kristijanhusak/vim-dadbod-completion",
				ft = { "sql", "mysql", "plsql" },
				lazy = true,
			},
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.dbs = {
				{
					name = "Escuela de Ventas",
					url = "duckdb:////mnt/c/Users/squijanr/OneDrive - NTT DATA EMEAL/Projects/03 - EDV Sharepoint Privado/6. Data Warehouse/warehouse.duckdb",
				},
				{
					name = "Generador de preguntas",
					url = "duckdb:////mnt/c/Users/squijanr/OneDrive - NTT DATA EMEAL/Projects/03 - EDV Sharepoint Privado/4. Limpiezas & Entregables/10. OranGEN Learning/saved_questions.duckdb",
				},
			}
			vim.g.db_ui_save_location = vim.fn.getcwd() .. "/sql_queries"
			vim.g.db_ui_execute_on_save = 0
			vim.g.db_ui_show_database_icon = 1
		end,
	},

	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({
				sources = {
					require("dbee.sources").MemorySource:new({
						name = "edv",
						type = "duck",
						url = "/mnt/c/Users/squijanr/OneDrive - NTT DATA EMEAL/Projects/03 - EDV Sharepoint Privado/6. Data Warehouse/warehouse.duckdb",
					}),
					require("dbee.sources").MemorySource:new({
						name = "pruebas",
						type = "sqlite",
						url = "~/pruebas.",
					}),
				},
			})
		end,
	},
}
