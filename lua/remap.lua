vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.keymap.set("n", "<leader>oc", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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

-- Quick fix list navigation
vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>")

-- Quick fix list open/close
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", {desc = '[Q]uickfix [O]pen'})
vim.keymap.set("n", "<leader>qp", "<cmd>cclose<CR>", {desc = '[Q]uickfix Close'})

-- NeoTree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")

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

-- Remap for lsp_lines plugin
vim.keymap.set(
    "",
    "<leader>do",
    require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
)

-- Diagnostics config and setting lsp_lines off by default
vim.diagnostic.config({
    virtual_lines = false,
    float = {
        header = false,
        border = 'rounded',
        focusable = true
    }
})

-- Diffview
local function get_default_branch_name()
	local res = vim
		.system({ 'git', 'rev-parse', '--verify', 'main' }, { capture_output = true })
		:wait()
	return res.code == 0 and 'main' or 'master'
end
vim.keymap.set("n", "<leader>vc", "<cmd>DiffviewClose<cr>", { desc = "Diff[v]iew [C]lose" })

vim.keymap.set("n", "<leader>vah", "<cmd>DiffviewOpen<cr>", { desc = "Diff[v]iew [A]gainst [H]ead" })
vim.keymap.set("n", "<leader>vam", function() vim.cmd('DiffviewOpen ' .. get_default_branch_name()) end, { desc = "Diff[v]iew [A]gainst [M]ain local branch" })
vim.keymap.set("n", "<leader>vaM", function() vim.cmd('DiffviewOpen HEAD..origin/' .. get_default_branch_name()) end, { desc = "Diff[v]iew [A]gainst [M]ain origin branch" })

vim.keymap.set("n", "<leader>vhr", "<cmd>DiffviewFileHistory<cr>", { desc = "Diff[v]iew [R]epo [H]istory"})
vim.keymap.set("n", "<leader>vhf", "<cmd>DiffviewFileHistory --follow %<cr>", { desc = "Diff[v]iew [F]ile [H]istory"})
vim.keymap.set("n", "<leader>vhl", "<cmd>.DiffviewFileHistory --follow<cr>", { desc = "Diff[v]iew [L]ine [H]istory"})

--inc rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- Cellular Automation
vim.keymap.set("n", "<leader>fjo", "<cmd>CellularAutomaton make_it_rain<cr>", { desc = "Make it Rain"})

-- Buffer navigation
vim.keymap.set("n", "[s", "<cmd>BufSurfBack<cr>", { desc = "[S]urf Back"})
vim.keymap.set("n", "]s", "<cmd>BufSurfForward<cr>", { desc = "[S]urf Forward"})

-- Remap to Toggle Diagnostics on current buffer
local diagnostics_active = true
local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.show(nil, 0)
    else
        vim.diagnostic.hide(nil, 0)
    end
end

vim.keymap.set('n', '<leader>dt', toggle_diagnostics, { desc = '[D]iagnostics [T]oggle' })

-- nvim-ufo
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Multiple Indentation (keep visual selection when indenting)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Command line window
-- : -> q:
-- / -> q/
-- ? -> q?

-- Treesitter context
vim.keymap.set("n", "<C-g>", "<cmd>TSContext toggle<cr>", { desc = 'Toggle TS Context'})

-- Copy to clipboard
function copyToClipboard(pattern)
    local path = vim.fn.expand(pattern)
    vim.fn.setreg('+', path) -- write to clippoard
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end

vim.keymap.set('n', '<leader>yr', function() copyToClipboard('%:p:.') end, { noremap = true, silent = true, desc = '[Y]ank [R]elative Path' })
vim.keymap.set('n', '<leader>ya', function() copyToClipboard('%:p') end, { noremap = true, silent = true , desc = '[Y]ank [A]bsolute Path' })
vim.keymap.set('n', '<leader>yd', function() copyToClipboard('%:h') end, { noremap = true, silent = true, desc = '[Y]ank [D]irectory Name'  })
vim.keymap.set('n', '<leader>yf', function() copyToClipboard('%:t') end, { noremap = true, silent = true , desc = '[Y]ank [F]ile Name' })
