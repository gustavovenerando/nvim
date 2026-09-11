local parsers = {
    "javascript",
    "typescript",
    "rust",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "cpp",
    "css",
    "sql",
    "json",
    "html",
    "python",
    "bash",
    "markdown",
    "markdown_inline",
}

require("nvim-treesitter").install(parsers)

local group = vim.api.nvim_create_augroup("user_treesitter", {
    clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)

        if ok and vim.bo[args.buf].filetype ~= "python" then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
    },
    move = {
        set_jumps = true,
    },
})

local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")
local swap = require("nvim-treesitter-textobjects.swap")

vim.keymap.set({ "x", "o" }, "aa", function()
    select.select_textobject("@parameter.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ia", function()
    select.select_textobject("@parameter.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "af", function()
    select.select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "if", function()
    select.select_textobject("@function.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ac", function()
    select.select_textobject("@class.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ic", function()
    select.select_textobject("@class.inner", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]m", function()
    move.goto_next_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]]", function()
    move.goto_next_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
    move.goto_next_end("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "][", function()
    move.goto_next_end("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
    move.goto_previous_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[[", function()
    move.goto_previous_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
    move.goto_previous_end("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[]", function()
    move.goto_previous_end("@class.outer", "textobjects")
end)

vim.keymap.set("n", "<leader>x", function()
    swap.swap_next("@parameter.inner")
end)

vim.keymap.set("n", "<leader>X", function()
    swap.swap_previous("@parameter.inner")
end)

require("treesitter-context").setup({
    enable = true,
    multiwindow = false,
    max_lines = 9,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    separator = nil,
    zindex = 20,
})
