vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.keymap.set("n", "<leader>oc", vim.cmd.Ex)

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
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open [D]iagnostics [L]ist" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = "Open [D]iagnostics [F]loat" })

-- Terminal remaps
vim.keymap.set("n", "<leader>t", ":terminal<cr>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Better window navigation
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Create new windows
-- vim.keymap.set("n", "<leader>nw", "<C-w>v<C-w>l")
-- vim.keymap.set("n", "<leader>uw", "<C-w>s<C-w>j")

-- History Buffer navigation
vim.keymap.set("n", "<leader>p", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<leader>n", "<cmd>bnext<cr>")

-- NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree toggle <CR>")

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

-- Highlight a word with * without moving cursor
vim.keymap.set('n', '*', 'mP*N`P')

-- Remap for lsp_lines plugin
vim.keymap.set(
    "",
    "<leader>do",
    require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
)

-- lsp_lines off by default
vim.diagnostic.config({ virtual_lines = false })

-- Diffview
vim.keymap.set("n", "<leader>vo", "<cmd>DiffviewOpen<CR>", { desc = "Diff[v]iew [O]pen" })
vim.keymap.set("n", "<leader>vc", "<cmd>DiffviewClose<CR>", { desc = "Diff[v]iew [C]lose" })
vim.keymap.set("n", "<leader>vh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diff[v]iew File [H]istory"})

--inc rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")
