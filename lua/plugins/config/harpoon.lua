local harpoon = require "harpoon"
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
end)
vim.keymap.set("n", "<tab>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<A-l>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-h>", function() harpoon:list():next() end)
