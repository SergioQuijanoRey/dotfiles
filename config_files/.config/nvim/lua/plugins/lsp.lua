return {
    -- Builtin lsp
    {
        -- Main plugin
        "neovim/nvim-lspconfig",

        -- Dependencies for the plugin
        dependencies = {
            -- Signature hint plugin
            "ray-x/lsp_signature.nvim",
            -- Completion engine
            "saghen/blink.cmp",
        },
        config = function()
            -- Mostly copied from https://github.com/neovim/nvim-lspconfig#keybindings-and-completion

            -- Use our custom function to set keymaps
            local setmap = require("myconf/aux").setmap
            local setmap_group_name = require("myconf/aux").setmap_group_name

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                local function buf_set_option(...)
                    vim.api.nvim_buf_set_option(bufnr, ...)
                end

                -- Options for the mappings that work with buffers
                local bufopts = { noremap = true, silent = true, buffer = bufnr }

                -- Keymappings
                setmap_group_name("<leader>q", "LSP commands")
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

                -- Signature hint plugin
                require("lsp_signature").on_attach({
                    bind = true, -- Mandatory for registring border config
                    hint_prefix = "🐼 ",
                    handler_opts = {
                        border = "rounded",
                    },
                })
            end

            -- Keymaps that I want to have even when there is no running LSP
            local opts = { noremap = true, silent = true }
            setmap("n", "<leader>qe", vim.diagnostic.open_float, opts, "Open float")
            setmap("n", "<leader>qc", vim.diagnostic.setloclist, opts, "Set location list")

            -- Rounded borders for hover and signature help
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

            -- We need to manually specify which servers we want to configure
            -- Some languages are commented, because I am not using them now but might use them in the future
            -- As we have set `automatic_installation = true`, this servers are installed automatically
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

                "pylsp",

                -- For writing some Ocaml
                "ocamllsp",

                -- For writing typst documents
                "tinymist",
            }

            -- Capabilities that blink completion engine needs to inform about
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Iterate over all installed servers and apply the config to them
            for _, server in ipairs(servers) do
                -- Setup given server
                require("lspconfig")[server].setup({
                    on_attach = on_attach,

                    -- Capabilities that were modified to talk with nvim-cmp
                    capabilities = capabilities,

                    -- Options to the lsp configuration
                    settings = {
                        -- For better performance
                        flags = {
                            debounce_text_changes = 150,
                        },
                    },
                })
            end
        end,
    },

    -- UI for showing the LSP init progress
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = true,
    },

    -- Install LSPs, linters, debuggers, ... really easily
    { "williamboman/mason.nvim", config = true },
}
