vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#aba9a9 gui=nocombine]]


require("indent_blankline").setup {
    show_trailing_blankline_indent = false,
    show_current_context = false,
    char_highlight_list = {
        "IndentBlanklineIndent1",
    }
}
