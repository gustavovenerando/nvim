vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

-- Sync clipboard between OS and Neovim
vim.o.clipboard = "unnamedplus"

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
