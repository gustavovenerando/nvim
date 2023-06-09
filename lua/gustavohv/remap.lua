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
vim.keymap.set("n", "<leader>nw", "<C-w>v<C-w>l")
vim.keymap.set("n", "<leader>uw", "<C-w>s<C-w>j")

-- Buffer navigatiof
-- vim.keymap.set("n", "<A-l>", ":bnext<CR>")
-- vim.keymap.set("n", "<A-h>", ":bprevious<CR>")

--Delete current buffer and go to last open buffer
vim.keymap.set("n", "<leader>q", ":<C-U>bprevious <bar> bdelete #<CR>")

-- NeoTree
vim.keymap.set("n", "<leader>e", ":NeoTreeShowToggle<cr>")

-- After yank several lines cursor doesn't change position
vim.keymap.set("v", "y", "ygv<Esc>")

-- Expression mapping for i that will indent properly on empty lines
vim.keymap.set("n", "i", function()
    if #vim.fn.getline(".") == 0 then
        return [["_cc]]
    else
        return "i"
    end
end, { expr = true })

-- Expression mapping for dd that doesn't yank an empty line into your default register
vim.keymap.set("n", "dd", function()
    if vim.api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
    else
        return "dd"
    end
end, { expr = true })

-- Auto-formating
vim.keymap.set('v', '<A-=>', vim.lsp.buf.format)

-- Cltr + c that triggers InsertLeave autocommand event
vim.keymap.set('i', '<C-c>', '<Esc>')
