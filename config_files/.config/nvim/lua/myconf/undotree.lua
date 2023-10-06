local setmap = require("myconf/aux").setmap

setmap('n', '<F3>', vim.cmd.UndotreeToggle, {}, "Toggle undo tree")
