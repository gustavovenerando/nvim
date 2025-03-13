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

-- Highlights
local highlight = vim.api.nvim_set_hl
local frappe = require("catppuccin.palettes").get_palette "frappe"
highlight(0, "TreesitterContextBottom", { underline = true, sp = frappe.overlay1 })
highlight(0, "TreesitterContextLineNumberBottom", { underline = true, sp = frappe.overlay1 })
