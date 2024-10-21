require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 70,
        height = vim.api.nvim_win_get_height(0) - 40,
    }
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[Harpoon] Add file" })
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "[Harpoon] Toggle quick menu" })

vim.keymap.set("n", "<A-l>", ui.nav_next, { desc = "[Harpoon] Next" })
vim.keymap.set("n", "<A-h>", ui.nav_prev, { desc = "[Harpoon] Previous" })

