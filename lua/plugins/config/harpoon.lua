require("harpoon").setup({
    menu = {
        width = math.floor(vim.o.columns * 0.45),
        height = math.floor(vim.o.lines * 0.25),
    },
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[Harpoon] Add file" })

vim.keymap.set("n", "<C-f>", function()
    ui.toggle_quick_menu()

    vim.schedule(function()
        local buf = vim.api.nvim_get_current_buf()

        if vim.bo[buf].filetype == "harpoon" then
            local row = vim.api.nvim_win_get_cursor(0)[1]
            vim.api.nvim_win_set_cursor(0, { row, 0 })
        end
    end)
end, { desc = "[Harpoon] Toggle quick menu" })

vim.keymap.set("n", "<A-l>", ui.nav_next, { desc = "[Harpoon] Next" })
vim.keymap.set("n", "<A-h>", ui.nav_prev, { desc = "[Harpoon] Previous" })

