-- Config for the status line that i am using

-- Show the lsp server that is attached to current buffer
-- Inspired by https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
-- Changed a little bit the function and added some symbols. Also not using ins_left function
local function lsp_server_names()
    local msg = "Inactive"
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return "🧠 " .. msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return "🧠 " .. client.name
        end
    end
    msg = "🧠 " .. msg
    return msg
end

-- Show the configured linters
local function linter_names()
    local linters = require("lint").get_running()
    if #linters == 0 then
        return "🔍 Inactive"
    end
    return "🔍 " .. linters[1]
end

-- Show the configured formatters
local function formatter_names()
    local formatters = require("conform").list_formatters()

    if #formatters == 0 then
        return "🍓 Inactive"
    end

    return "🍓 Active"
end

local config = {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff',
            { 'diagnostics', sources = { 'nvim_diagnostic', 'coc' } } },
        lualine_c = { 'filename' },
        lualine_x = { lsp_server_names, linter_names, formatter_names,


            'encoding', 'fileformat', 'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}



require 'lualine'.setup(config)
