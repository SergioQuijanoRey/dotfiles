 require('telescope').setup{
  defaults = {
    -- We are using the default sorter, that now works better than the rest
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
  }
}
