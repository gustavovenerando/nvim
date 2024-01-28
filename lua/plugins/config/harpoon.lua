require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 70,
        height = vim.api.nvim_win_get_height(0) - 40,
    }
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

vim.keymap.set("n", "<leader>a", mark.add_file)

vim.keymap.set("n", "<leader>j1", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>j2", function() term.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>j3", function() term.gotoTerminal(3) end)
vim.keymap.set("n", "<leader>j4", function() term.gotoTerminal(4) end)

vim.keymap.set("n", "<A-l>", ui.nav_next)
vim.keymap.set("n", "<A-h>", ui.nav_prev)
