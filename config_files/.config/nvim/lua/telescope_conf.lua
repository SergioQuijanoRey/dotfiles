 require('telescope').setup{
  defaults = {
    -- I prefer this sorter than default one
    --file_sorter = require'telescope.sorters'.get_fzy_sorter,
  }
}

-- CoC integration into telescope
require('telescope').load_extension('coc')
