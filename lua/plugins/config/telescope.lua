require("telescope").load_extension("advanced_git_search")
require("telescope").load_extension("yank_history")
require("telescope").load_extension("undo")

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

vim.keymap.set('n', '<C-p>', function()
    telescope_builtin.find_files({no_ignore = true})
end, { desc = '[S]earch All [F]iles' })
vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sf', telescope_builtin.git_files, { desc = '[S]earch Git [F]iles' });

-- Change buffer layout and adding map to allow delete buffer with telescope window open
local actions = require("telescope.actions")
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<C-l>'] = actions.smart_send_to_qflist,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
            }
        },
        layout_config = {
            horizontal = { preview_width = 0.55 },
        }
    },
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
        },
    },
    extensions = {
        undo = {
            mappings = {
                i = {
                    ["<cr>"] = require("telescope-undo.actions").restore,
                    ["<C-d>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-a>"] = require("telescope-undo.actions").yank_additions,
                },
            },
        },
    },

})

-- Yanky history with telescope
-- vim.keymap.set("n", "<leader>ks", require("telescope").extensions.yank_history.yank_history, {desc = 'Yan[k]y [S]earch History'})
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

-- Live grep in visual selection
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

vim.keymap.set('v', '<space>sw', function()
	local text = vim.getVisualSelection()
	telescope_builtin.live_grep({ default_text = text })
end, { noremap = true, silent = true })

-- Last Telescope Command
vim.keymap.set("n", "<leader>ls", telescope_builtin.resume, {desc = '[L]ast Telescope [S]earch'})

-- Quickfix History
vim.keymap.set("n", "<leader>ql", telescope_builtin.quickfixhistory, {desc = '[Q]uickfix [L]ist History'})

-- advanced_git_search
vim.keymap.set("n", "<leader>dc", require('telescope').extensions.advanced_git_search.diff_commit_file,{ desc = '[D]iff File [C]ommit' } )
vim.keymap.set("n", "<leader>db", require('telescope').extensions.advanced_git_search.diff_branch_file, { desc = '[D]iff File [B]ranch'})

-- undo
vim.keymap.set("n", "<leader>u", require('telescope').extensions.undo.undo, { desc = "[U]ndo History"})
