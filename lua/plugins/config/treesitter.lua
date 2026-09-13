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

-- Treesitter highlighting + indentation
local group = vim.api.nvim_create_augroup("user_treesitter", {
    clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,

    callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)

        if ok and vim.bo[args.buf].filetype ~= "python" then
            vim.bo[args.buf].indentexpr =
                "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- Treesitter textobjects
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

-- Textobject selection
local textobjects = {
    aa = "@parameter.outer",
    ia = "@parameter.inner",
    af = "@function.outer",
    ["if"] = "@function.inner",
    ac = "@class.outer",
    ic = "@class.inner",
}

for key, query in pairs(textobjects) do
    vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
    end)
end

-- Textobject movement
local movements = {
    ["]m"] = { move.goto_next_start, "@function.outer" },
    ["]]"] = { move.goto_next_start, "@class.outer" },

    ["]M"] = { move.goto_next_end, "@function.outer" },
    ["]["] = { move.goto_next_end, "@class.outer" },

    ["[m"] = { move.goto_previous_start, "@function.outer" },
    ["[["] = { move.goto_previous_start, "@class.outer" },

    ["[M"] = { move.goto_previous_end, "@function.outer" },
    ["[]"] = { move.goto_previous_end, "@class.outer" },
}

for key, mapping in pairs(movements) do
    local fn, query = unpack(mapping)

    vim.keymap.set({ "n", "x", "o" }, key, function()
        fn(query, "textobjects")
    end)
end

-- Swap parameters
vim.keymap.set("n", "<leader>x", function()
    swap.swap_next("@parameter.inner")
end)

vim.keymap.set("n", "<leader>X", function()
    swap.swap_previous("@parameter.inner")
end)

-- Incremental selection
vim.keymap.set({ "n", "x" }, "<C-Space>", function()
    vim.treesitter.select("parent", vim.v.count1)
end, {
    desc = "Expand Tree-sitter selection",
})

vim.keymap.set("x", "<C-h>", function()
    vim.treesitter.select("child", vim.v.count1)
end, {
    desc = "Shrink Tree-sitter selection",
})

-- Treesitter context
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
