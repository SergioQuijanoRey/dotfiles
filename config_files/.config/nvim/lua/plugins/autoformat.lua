return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			typst = { "typstfmt" },
			nix = { "alejandra" },
			sql = { "sqruff" },
			python = {
				-- To fix auto-fixable lint errors.
				"ruff_fix",
				-- To run the Ruff formatter.
				"ruff_format",
				-- To organize the imports.
				"ruff_organize_imports",
			},
		},

		-- To utilize our user-defined functions to enable/disable autoformating
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- NOTE: `lsp_fallback` allows us to use the lsp formatter when no
			-- formatter is configured here
			return { timeout_ms = 500, lsp_fallback = true }
		end,

		-- Format just a range of code
		vim.keymap.set("", "<leader>qf", function()
			require("conform").format({ async = true }, function(err)
				if not err then
					local mode = vim.api.nvim_get_mode().mode
					if vim.startswith(string.lower(mode), "v") then
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
					end
				end
			end)
		end, { desc = "Format range of code using conform.nvim" }),
	},
}
