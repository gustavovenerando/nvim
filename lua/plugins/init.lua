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
		branch = "0.1.x",
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

	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" },

	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require("plugins.config.treesitter")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		version = "2.20.8",
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
		opts = {},
	},

	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},

	"eandrju/cellular-automaton.nvim",
	"windwp/nvim-ts-autotag",
	"ton/vim-bufsurf",
})
