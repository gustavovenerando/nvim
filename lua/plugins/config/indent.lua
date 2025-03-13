vim.cmd [[highlight IblIndent guifg=#8285ab gui=nocombine]]

require("ibl").setup({
    indent = {
        -- Center
        -- char = "┃"
        char = "│"

        -- Left
        -- char = "▏"
    },
    scope = {
        enabled = false
    }
})
