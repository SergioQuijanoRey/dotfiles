-- Configure linters by filetype
-- See available linters in https://github.com/mfussenegger/nvim-lint#available-linters
require('lint').linters_by_ft = {
    python = {"ruff"},
}

-- Run the linter when saving the file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
