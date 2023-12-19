require("nvim-possession").setup({
    sessions = {
        sessions_path = '/home/gustavohv/sessions/', -- folder to look for sessions, must be a valid existing path
        sessions_variable = ..., -- defines vim.g[sessions_variable] when a session is loaded
        sessions_icon = ...,
    },

    autoload = false, -- whether to autoload sessions in the cwd at startup
    autosave = true, -- whether to autosave loaded sessions before quitting
    autoswitch = {
        enable = true, -- whether to enable autoswitch
        exclude_ft = {}, -- list of filetypes to exclude from autoswitch
    },

    post_hook = nil, -- callback, function to execute after loading a session
                    -- useful to restore file trees, file managers or terminals
                    -- function()
                    --     require('FTerm').open()
                    --     require('nvim-tree').toggle(false, true)
                    -- end

    fzf_winopts = {
        -- any valid fzf-lua winopts options, for instance
        width = 0.5,
        preview = {
            vertical = "right:30%"
        }
    }
})

local possession = require("nvim-possession")

vim.keymap.set("n", "<leader>cl",function()
    possession.list()
end)

vim.keymap.set("n", "<leader>cn", function()
    possession.new()
end)

vim.keymap.set("n", "<leader>cu", function()
    possession.update()
end)

vim.keymap.set("n", "<leader>cd", function()
    possession.delete()
end)
