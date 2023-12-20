
vim.opt.termguicolors = true

-- Work well with nvim-tree (Disable netrw to open directory)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.relativenumber = true

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

