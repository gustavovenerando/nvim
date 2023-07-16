-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('ThePrimeagen/vim-be-good')

    use { "catppuccin/nvim", as = "catppuccin" }

    use('xiyaowong/transparent.nvim')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('lukas-reineke/indent-blankline.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    use('numToStr/Comment.nvim')

    use('lewis6991/gitsigns.nvim')

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        "akinsho/toggleterm.nvim",
    }

    use {
        'gennaro-tedesco/nvim-possession',
        requires = {
            {
                'ibhagwan/fzf-lua',
                { 'junegunn/fzf', run = ":call fzf#install()" }
            },
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'ThePrimeagen/harpoon',
        requires = { 'nvim-lua/plenary.nvim' }
    }
end)
