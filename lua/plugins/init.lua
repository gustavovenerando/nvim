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

return require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
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

    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },

    {
        'nvim-treesitter/nvim-treesitter',
        event = "VeryLazy",
        build = ':TSUpdate',
        config = function()
            require("plugins.config.treesitter")
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        version = "2.20.8",
        config = function()
            require("plugins.config.indent")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        -- event = 'InsertEnter',
        event = 'VeryLazy',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-emoji",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("plugins.config.cmp")
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        event = { 'BufRead', 'BufNewFile' },
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },   -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },   -- Required
        },
        config = function()
            require("plugins.config.lsp")
        end,

    },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins.config.tree")
        end,
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require("plugins.config.comment");
        end,
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("plugins.config.gitsigns");
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugins.config.toggleterm");
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            require("plugins.config.lualine");
        end,
    },

    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugins.config.harpoon");
        end,
    },

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },

    {
        'goolord/alpha-nvim',
        dependencies = { 'BlakeJC94/alpha-nvim-fortune' },
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

    "sindrets/diffview.nvim",

    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        config = function()
            -- optional: setup telescope before loading the extension
            require("telescope").setup({
                -- move this to the place where you call the telescope setup function
                extensions = {
                    advanced_git_search = {
                        -- fugitive or diffview
                        diff_plugin = "diffview",
                        -- customize git in previewer
                        -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
                        git_flags = {},
                        -- customize git diff in previewer
                        -- e.g. flags such as { "--raw" }
                    git_diff_flags = {},
                        -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
                        show_builtin_git_pickers = false,
                        entry_default_author_or_date = "author", -- one of "author" or "date"
                    },
                },
            })

            require("telescope").load_extension("advanced_git_search")
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    },

    {
        "debugloop/telescope-undo.nvim",
        dependencies = { -- note how they're inverted to above example
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            { -- lazy style key map
                "<leader>u",
                "<cmd>Telescope undo<cr>",
                desc = "[U]ndo History",
            },
        },
        opts = {
            -- don't use `defaults = { }` here, do this in the main telescope spec
            extensions = {
                undo = {
                    -- telescope-undo.nvim config, see below
                },
                -- no other extensions here, they can have their own spec too
            },
        },
        config = function(_, opts)
            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
})
