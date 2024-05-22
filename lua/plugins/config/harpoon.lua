local harpoon = require "harpoon"
harpoon:setup({
    settings = {
        save_on_toggle = true,
    }
})

local toggle_opts = {
    border = "rounded",
    title_pos = "center",
    ui_width_ratio = 0.50,
}

vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
end)
vim.keymap.set("n", "<Tab>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
end)

vim.keymap.set("n", "<A-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-l>", function() harpoon:list():next() end)
