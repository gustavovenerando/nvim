
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Show buffer search and replace
vim.opt.inccommand = "split"

-- Stop screen from shifting when there are gitdiffs or error/warning symbols
vim.opt.signcolumn = "yes:1"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 40

vim.opt.wrap = false

-- nvim-ufo
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

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
  command = "if mode() != 'c' | silent! checktime | endif",
  pattern = { "*" },
})

