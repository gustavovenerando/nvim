require("oil").setup {
    columns = { "icon" },
    view_options = {
        show_hidden = true,
    },
    lsp_file_methods = {
        enabled = true,
        timeout_ms = 2000,
        autosave_changes = true
    },
    keymaps = {
        -- Close on ESQ
        -- ["<C-[>"] = "actions.close",
        ["<leader>c"] = "actions.close",
    },
}

-- Open parent directory in current window
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "[O]il - Open parent directory" })

-- Open parent directory in floating window
vim.keymap.set("n", "<leader>fo", require("oil").toggle_float,  { desc = "[F]loat [O]il - Open parent directory" })
