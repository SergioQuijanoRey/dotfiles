-- Config for builtin lsp
-- Mostly copied from https://github.com/neovim/nvim-lspconfig#keybindings-and-completion

-- Load the plugin (lua imports modules this way)
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Options for the mappings
    local opts = { noremap=true, silent=true }

    -- Keymappings
    buf_set_keymap('n', '<leader>qr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- rename
    buf_set_keymap('n', '<leader>qd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts) -- go to definition
    buf_set_keymap('n', '<leader>qa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- code actions
    buf_set_keymap('n', '<leader>ql', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>qs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap("n", "<leader>qf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_set_keymap('n', '<leader>qk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

    --buf_set_keymap("n", "<space>qd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)



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

-- LSP installer
-- We need this to query all the LSPs that we've installed using this package
local lsp_installer = require("nvim-lsp-installer")

-- Also, get capabilities of nvim-cmp for autocompletions
-- We need to attach this autocomp capabilites to LSPs
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Same function of lsp setup used in lsp_config, but here we query all
-- servers installed using lsp install package
lsp_installer.on_server_ready(function(server)

    -- Options to the lsp configuration
    local opts = {
        -- For better performance
        flags = {
            debounce_text_changes = 500,
        },

        on_attach = on_attach,
        capabilities = capabilities

    }

    -- Call setup on current server we're configuring
    server:setup(opts)
end)

-- Setup julia manually
nvim_lsp.julials.setup{}
