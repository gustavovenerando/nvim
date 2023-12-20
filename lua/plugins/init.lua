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
        dependencies = { {'nvim-lua/plenary.nvim'} },
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
        version="2.20.8",
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
            {'neovim/nvim-lspconfig'},             -- Required

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
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
        config = function ()
            require("plugins.config.comment");
        end,
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require("plugins.config.gitsigns");
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    {
        "akinsho/toggleterm.nvim",
        config = function ()
            require("plugins.config.toggleterm");
        end,
    },

    {
        'gennaro-tedesco/nvim-possession',
        dependencies = {
            {
                'ibhagwan/fzf-lua',
                { 'junegunn/fzf', build = ":call fzf#install()" }
            },
        },
        config = function ()
            require("plugins.config.session");
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function ()
            require("plugins.config.lualine");
        end,
    },

    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
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
        dependencies = {'BlakeJC94/alpha-nvim-fortune'},
        config = function()
            require("plugins.config.alpha")
        end,
    }

})
