-- Before the lazy.nvim config of the plugin, we have some functions that will
-- display custom information on the status line

-- Show the lsp server that is attached to current buffer
-- Inspired by https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
-- Changed a little bit the function and added some symbols. Also not using ins_left function
local function lsp_server_names()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_clients()

    if next(clients) == nil then
        return "🧠 Inactive"
    end

    local acc_name = ""

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            if acc_name == "" then
                acc_name = client.name
            else
                acc_name = acc_name .. "|" .. client.name
            end
        end
    end

    if acc_name == "" then
        acc_name = "Inactive"
    end

    return "🧠 " .. acc_name
end

-- Show the configured linters
local function linter_names()
    local linters = require("lint").get_running()
    if #linters == 0 then
        return "🔍 Inactive"
    end

    -- Get all linter names
    local acc_linters = linters[1]
    for i = 1, #linters, 1 do
        if i == 1 then
            goto continue
        end

        acc_linters = acc_linters .. "|" .. linters[i]

        ::continue::
    end

    return "🔍 " .. acc_linters
end

-- Show the configured formatters
local function formatter_names()
    local formatters = require("conform").list_formatters()

    if #formatters == 0 then
        return "🍓 Inactive"
    end

    local first_formatter = formatters[1].name
    local acc_name = first_formatter

    for i = 1, #formatters, 1 do
        if i == 1 then
            goto continue
        end

        acc_name = acc_name .. "|" .. formatters[i].name

        ::continue::
    end


    return "🍓 " .. acc_name
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'kyazdani42/nvim-web-devicons',
        name = "nvim-web-devicons_lualine"
    },
    opts = {
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
}
