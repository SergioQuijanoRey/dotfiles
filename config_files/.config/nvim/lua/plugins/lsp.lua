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
            setmap("n", "<leader>qe", vim.diagnostic.open_float, opts, "Open diagnostic in float window")
            setmap("n", "<leader>qc", vim.diagnostic.setloclist, opts, "Set location list with diagnostics")
            setmap("n", "<leader>qr", vim.lsp.buf.rename, bufopts, "Rename")
            setmap("n", "<leader>qa", vim.lsp.buf.code_action, bufopts, "Code action")
            setmap("n", "<leader>qs", vim.lsp.buf.signature_help, bufopts, "Signature help")
            setmap("n", "<leader>qh", vim.lsp.buf.hover, bufopts, "Hover (docs)")
            setmap("n", "<leader>qf", function()
                vim.lsp.buf.format({ async = true })
            end, bufopts, "Manual format using the lsp")
            -- NOTE: this keybindings work better with telescope
            setmap("n", "<leader>ql", require('telescope.builtin').lsp_references, bufopts, "List references")
            setmap("n", "<leader>qi", require('telescope.builtin').lsp_implementations, bufopts, "Go to implementation")
            setmap("n", "<leader>qd", require('telescope.builtin').lsp_definitions, bufopts, "Go to definition")
            setmap("n", "<leader>qw", require('telescope.builtin').lsp_dynamic_workspace_symbols, bufopts,
                "Workspace Document symbols")

            -- Rounded borders for hover and signature help
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

            -- Diagnostic configuration
            vim.diagnostic.config({
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                } or {},
                virtual_text = {
                    source = 'if_many',
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end,
                }
            })

            -- List of servers that I want to have access to
            local servers = {

                -- For markdown
                "marksman",

                -- For latex
                "/texlab",

                -- For typst
                "tinymist",

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
                -- NOTE: disabled because we have configured that in `lua/plugins/linter.lua`
                -- "ruff",  -- Linter and formatter
                "pylsp", -- General purpose lsp

                -- For writing some Ocaml
                "ocamllsp",

                -- For writing typst documents
                "tinymist",
            }
            for _, server in pairs(servers) do
                vim.lsp.enable(server)
            end

            -- NOTE: disabled because we have configured that in `lua/plugins/linter.lua`
            -- and in `lua/plugins/autoformat.lua`
            -- We want to disable hover capabilities for ruff, as it will create
            -- problems with the actual LSP that does that job
            -- Got this from official ruff docs: https://docs.astral.sh/ruff/editors/setup/#neovim
            -- vim.api.nvim_create_autocmd("LspAttach", {
            --     group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
            --     callback = function(args)
            --         local client = vim.lsp.get_client_by_id(args.data.client_id)
            --         if client == nil then
            --             return
            --         end
            --         if client.name == 'ruff' then
            --             -- Disable hover in favor of Pyright
            --             client.server_capabilities.hoverProvider = false
            --         end
            --     end,
            --     desc = 'LSP: Disable hover capability from Ruff',
            -- })
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
