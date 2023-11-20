--- Configure the autoformatter

-- Setup conform as our autoformat pluign
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "isort" },
  },
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
