-- Linebreak for markdown and text files
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "text"},
    callback = function()
        vim.opt_local.textwidth = 90
        vim.opt_local.wrap = true
    end,
})

-- Smart Highlight search 
local hl_ns = vim.api.nvim_create_namespace('search')
local hlsearch_group = vim.api.nvim_create_augroup('hlsearch_group', { clear = true })

local function manage_hlsearch(char)
    local key = vim.fn.keytrans(char)
    local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }

    if vim.fn.mode() == 'n' then
        if not vim.tbl_contains(keys, key) then
            vim.cmd([[ :set nohlsearch ]])
        elseif vim.tbl_contains(keys, key) then
            vim.cmd([[ :set hlsearch ]])
        end
    end

    vim.on_key(nil, hl_ns)
end

vim.api.nvim_create_autocmd('CursorMoved', {
    group = hlsearch_group,
    callback = function()
        vim.on_key(manage_hlsearch, hl_ns)
    end,
})

-- Dont add comments on 'o' and others keys
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
    end,
})

-- Update buffer when modifications occours, like git pull or merge conflicts happens
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | silent! checktime | endif",
  pattern = { "*" },
})

-- 42 file config to c, cpp and make files
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"c", "cpp", "make"},
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.softtabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.expandtab = false
    end,
})

-- CursorLine autocmd
-- vim.api.nvim_set_hl(0, "CursorLine", {bg="gray"})
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "*",
--     command = [[highlight CursorLine guibg=NONE cterm=underline]],
--     -- callback = function()
--     --     vim.api.nvim_set_hl(0, "CursorLine", {bg="gray"})
--     --     -- vim.cmd([[
--     --     --     hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
--     --     -- ]])
--     -- end
-- })

