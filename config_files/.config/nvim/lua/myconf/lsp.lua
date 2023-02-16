-- Config for builtin lsp
-- Mostly copied from https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
-- Has to be runned after configuring mason

-- Load the plugin (lua imports modules this way)
local nvim_lsp = require('lspconfig')

-- Use our custom function to set keymaps
local setmap = require("myconf/aux").setmap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Options for the mappings that work with buffers
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    -- Keymappings
    setmap('n', '<leader>qr', vim.lsp.buf.rename, bufopts)
    setmap('n', '<leader>qd', vim.lsp.buf.definition, bufopts)
    setmap('n', '<leader>qi', vim.lsp.buf.implementation, bufopts)
    setmap('n', '<leader>qa', vim.lsp.buf.code_action, bufopts)
    setmap('n', '<leader>ql', vim.lsp.buf.references, bufopts)
    setmap('n', '<leader>qs', vim.lsp.buf.signature_help, bufopts)
    setmap('n', '<leader>qh', vim.lsp.buf.hover, bufopts)

    -- All keymaps are:
    -- local opts = { noremap=true, silent=true }
    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --     end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- Options for keymaps that work globally
    local opts = { noremap=true, silent=true }

    setmap('n', '<leader>qe', vim.diagnostic.open_float, opts)
    setmap('n', '<leader>qc', vim.diagnostic.setloclist, opts)

    -- Signature hint plugin
    cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
        fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true, -- virtual hint enable
        hint_prefix = "🐼 ",  -- Panda for parameter
        hint_scheme = "String",
        use_lspsaga = true,  -- set to true if you want to use lspsaga popup
        hi_parameter = "Search", -- how your parameter will be highlight
        max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
            border = "shadow"   -- double, single, shadow, none
        },
        extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    }

    require'lsp_signature'.on_attach(cfg)
end

-- Also, get capabilities of nvim-cmp for autocompletions
-- We need to provide lsp info to nvim-cmp config to get lsp autocompletion!
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Rounded borders for hover and signature help
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

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
    "rnix",

    -- TODO -- could not manage to install this package in NixOS
    -- For python
    -- Really fast because its written in Rust
    -- Replaces some functionality of pylsp
    -- "ruff_lsp",

    -- For python
    -- Enables a lot of plugins, like flake8, mypy, import sorting, rope, that have to be installed manually:
    --      https://github.com/williamboman/nvim-lsp-installer/blob/main/lua/nvim-lsp-installer/servers/pylsp/README.md
    -- Includes jedi, so no need to use that lsp when using pylsp
    "pylsp",

}

-- Iterate over all installed servers and apply the config to them
for _, server in ipairs(servers) do

    -- Setup given server
    require('lspconfig')[server].setup {
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
    }
end

-- Show the LSP setup progress with a nice UI
require"fidget".setup{}
