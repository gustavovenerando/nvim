local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "master",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            require("plugins.config.telescope")
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.config.colors")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        event = false,
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },
        config = function()
            require("plugins.config.treesitter")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.config.indent")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            { "j-hui/fidget.nvim", opts = {} },

            -- Schema information
            "b0o/SchemaStore.nvim",
        },
        config = function()
            require("plugins.config.lsp")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp",
                dependencies = {
                    {
                        'rafamadriz/friendly-snippets',
                        config = function()
                            require('luasnip.loaders.from_vscode').lazy_load()
                        end,
                    },
                }
            },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-emoji",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim"
        },
        config = function()
            require("plugins.config.cmp")
        end,
    },

    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.config.oil")
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins.config.tree")
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.config.comment")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.config.gitsigns")
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugins.config.toggleterm")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        config = function()
            require("plugins.config.lualine")
        end,
    },

    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        commit = "ccae1b9bec717ae284906b0bf83d720e59d12b91",
        config = function()
            require("plugins.config.harpoon")
        end,
    },

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },

    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.config.alpha")
        end,
    },

    {
        "gbprod/yanky.nvim",
        config = function()
            require("plugins.config.yanky")
        end,
    },

    {
        "tpope/vim-fugitive",
        config = function()
            require("plugins.config.fugitive")
        end,
    },

    {
        "sindrets/diffview.nvim",
        config = function()
            require("diffview").setup({
                file_panel = {
                    win_config = {
                        position = "bottom",
                        height = 15
                    }
                }
            })
        end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            win = {
                border = "rounded"
            }
        },
    },

    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup(
                        {
                            relculright = true,
                            segments = {
                                { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                                { text = { " " } },
                                { text = { "%s" },                  click = "v:lua.ScSa" },
                                { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                            }
                        }
                    )
                end,
            },
        },
        config = function()
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end

            require('ufo').setup({
                provider_selector = function()
                    return { 'treesitter', 'indent' }
                end,
                fold_virt_text_handler = handler
            })
        end,
    },

    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },

    "eandrju/cellular-automaton.nvim",
    "windwp/nvim-ts-autotag",
    "ton/vim-bufsurf",

    {
        "Diogo-ss/42-header.nvim",
        opts = {
            default_map = false,  -- Default mapping <F1> in normal mode.
            auto_update = false, -- Update header when saving.
            -- user = "username", -- Your user.
            -- mail = "your@email.com", -- Your mail.
        },
        config = function(_, opts)
            require("42header").setup(opts)
        end,
    },
})
