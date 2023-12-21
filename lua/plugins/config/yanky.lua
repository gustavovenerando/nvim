require("yanky").setup({
    ring = {
        history_length = 50,
        storage = "memory",
    },
    preserve_cursor_position = {
        enabled = false,
    },
    highlight = {
        timer = 150
    }
})

vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set("n", "[y", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "]y", "<Plug>(YankyNextEntry)");
