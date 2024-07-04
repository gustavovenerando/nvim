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

-- lsp_lines off by default
vim.diagnostic.config({
    virtual_lines = false,
    float = {
        header = false,
        border = 'rounded',
        focusable = true
    }
})

-- Diffview
vim.keymap.set("n", "<leader>vo", "<cmd>DiffviewOpen<CR>", { desc = "Diff[v]iew [O]pen" })
vim.keymap.set("n", "<leader>vc", "<cmd>DiffviewClose<CR>", { desc = "Diff[v]iew [C]lose" })
vim.keymap.set("n", "<leader>vh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diff[v]iew File [H]istory"})

--inc rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- solving a bug
local aloha = vim.api.nvim_create_augroup("aloha", {clear = true})
vim.api.nvim_create_autocmd({"CursorHold"}, {
    pattern = "*",
    group = aloha,
    command = "autocmd! CursorHold"
})
vim.api.nvim_create_autocmd({"CursorHold"}, {
    pattern = "*",
    group = aloha,
    command = "autocmd CursorHold * silent! checktime"
})

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


-- Dont add comments on 'o' and others keys
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
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
