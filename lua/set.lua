
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Show buffer search and replace
vim.opt.inccommand = "split"

-- Don't have `o` add a comment
vim.opt.formatoptions:remove "o"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.scrolloff = 8

vim.opt.wrap = false

-- Sync clipboard between OS and Neovim
vim.o.clipboard = "unnamedplus"

-- Enabling cursorline
vim.o.cursorline = true
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

-- Update buffer when modifications occours, like git pull or merge conflicts happens
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

