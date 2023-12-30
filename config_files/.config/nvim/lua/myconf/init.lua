-- In this file we are going to import all the files
-- So in the root `init.lua` we can simpy do a `require("lua/myconf")`, instead
-- of manually loading all the plugins

-- Where I manage plugins
-- Has to be before the other requires in order to first install packages and
-- then configure them using lua
require("myconf/plugin_manager")

-- The rest of the plugins don't require an specific order
require("myconf/treesitter")
require("myconf/telescope")
require("myconf/lsp")
require("myconf/linter")
require("myconf/snippets")
require("myconf/completion")
require("myconf/keybindings")
require("myconf/autopairs")
require("myconf/status_line")
require("myconf/slime")
require("myconf/debugging")
require("myconf/file_explorer")
require("myconf/diagnostics_list")
require("myconf/git")
require("myconf/smooth_scrolling")
require("myconf/visuals")
require("myconf/whichkey")
require("myconf/undotree")
require("myconf/autoformatter")
require("myconf/zen")
