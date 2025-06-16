return {
	-- Builtin lsp
	{
		-- Main plugin
		"neovim/nvim-lspconfig",

		-- Dependencies for the plugin
		-- We are doing their configs in their own entry
		dependencies = {
			-- Signature hint plugin
			"ray-x/lsp_signature.nvim",
			-- Completion engine
			"saghen/blink.cmp",
		},

		config = function()
			-- Keymaps for the lsp
			local setmap = require("myconf/aux").setmap
			local setmap_group_name = require("myconf/aux").setmap_group_name
			local opts = { noremap = true, silent = true }

			setmap_group_name("<leader>q", "LSP commands")
			setmap("n", "<leader>qe", vim.diagnostic.open_float, opts, "Open float")
			setmap("n", "<leader>qc", vim.diagnostic.setloclist, opts, "Set location list")
			setmap("n", "<leader>qr", vim.lsp.buf.rename, bufopts, "Rename")
			setmap("n", "<leader>qd", vim.lsp.buf.definition, bufopts, "Go to definition")
			setmap("n", "<leader>qi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
			setmap("n", "<leader>qa", vim.lsp.buf.code_action, bufopts, "Code action")
			setmap("n", "<leader>ql", vim.lsp.buf.references, bufopts, "List references")
			setmap("n", "<leader>qs", vim.lsp.buf.signature_help, bufopts, "Signature help")
			setmap("n", "<leader>qh", vim.lsp.buf.hover, bufopts, "Hover (docs)")
			setmap("n", "<leader>qf", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts, "Manual Format")

			-- Rounded borders for hover and signature help
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			-- Diagnostic configuration
			vim.diagnostic.config({ virtual_text = true })
			vim.diagnostic.config({ virtual_lines = { current_line = true } })

			-- List of servers that I want to have access to
			local servers = {

				-- For markdown
				"marksman",

				-- For latex
				"/texlab",

				-- For C / C++
				"clangd",

				-- For R
				"r_language_server",

				-- For Rust
				"rust_analyzer",

				-- For lua
				"lua_ls",

				-- For nix
				"nixd",

				-- For python
				"ty", -- Static checking
				"ruff", -- Linter and formatter
				"pylsp", -- General purpose lsp

				-- For writing some Ocaml
				"ocamllsp",

				-- For writing typst documents
				"tinymist",
			}
			for _, server in pairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},

	-- UI for showing the LSP init progress
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = true,
	},

	-- Signature plugin
	{
		"ray-x/lsp_signature.nvim",
		config = {

			bind = true, -- Mandatory for registring border config
			hint_prefix = "🐼 ",
			handler_opts = {
				border = "rounded",
			},
		},
	},
}
