vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#8285ab gui=nocombine]]

require("indent_blankline").setup {
    -- char = "▎",
    show_trailing_blankline_indent = false,
    show_current_context = false,
    char_highlight_list = {
        "IndentBlanklineIndent1",
    }
}
