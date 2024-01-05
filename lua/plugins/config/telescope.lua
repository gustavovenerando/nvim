require("telescope").load_extension("advanced_git_search")
require("telescope").load_extension("yank_history")

local telescope_builtin = require('telescope.builtin');

vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    layout_config = {
        width = 120,
        height = 50
    }
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sf', telescope_builtin.git_files, { desc = '[S]earch Git [F]iles' });

-- Change buffer layout and adding map to allow delete buffer with telescope window open
local actions = require("telescope.actions")
require('telescope').setup({
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            layout_config = {
                width = 120,
                height = 50
            },
            previewer = false,
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer,
                }
            }
        },
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            layout_config = { 
                preview_width = 0.5,
            }
        },
    },
})

-- Yanky history with telescope
vim.keymap.set("n", "<leader>ks", require("telescope").extensions.yank_history.yank_history, {desc = 'Yan[k]y [S]earch History'})
-- vim.keymap.set("n", "<leader>ks", function ()
--     require("telescope").extensions.yank_history.yank_history (require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--     layout_config = {
--         width = 120,
--         height = 50
--     }
--   })
-- end
-- )

-- Last search
vim.keymap.set("n", "<leader>ls", telescope_builtin.resume, {desc = '[L]ast Telescope [S]earch'})

-- advanced_git_search
vim.keymap.set("n", "<leader>dc", require('telescope').extensions.advanced_git_search.diff_commit_file,{ desc = '[D]iff File [C]ommit' } )
vim.keymap.set("n", "<leader>db", require('telescope').extensions.advanced_git_search.diff_branch_file, { desc = '[D]iff File [B]ranch'})
