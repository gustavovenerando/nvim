vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("n", "<leader>oc", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- New line while normal mode
vim.keymap.set("n", "<leader>l", "o<C-c>")

vim.keymap.set("x", "<leader>p", "\"_dP")

--Diagnostics
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

-- Terminal remaps
vim.keymap.set("n", "<leader>t", ":terminal<cr>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Better window navigation
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Create new windows
vim.keymap.set("n", "<leader>wl", "<C-w>v")
vim.keymap.set("n", "<leader>wj", "<C-w>s")

-- Buffer navigation
vim.keymap.set("n", "<A-l>", ":bnext<CR>")
vim.keymap.set("n", "<A-h>", ":bprevious<CR>")

--Delete current buffer
vim.keymap.set("n", "<leader>q", ":<C-U>bprevious <bar> bdelete #<CR>")

-- NeoTree
vim.keymap.set("n", "<leader>e", ":NeoTreeShowToggle<cr>")

