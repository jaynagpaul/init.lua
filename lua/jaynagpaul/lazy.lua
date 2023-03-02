local vim = vim -- For LSP diagnostic purposes

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

-- PLUGINS
local plugins = {
	{"savq/melange-nvim", lazy = false, priority = 1000},

	{"nvim-telescope/telescope.nvim", tag = '0.1.1',
		dependencies = {"nvim-lua/plenary.nvim",}},

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "github/copilot.vim" },

	{ "VonHeikemen/lsp-zero.nvim", branch = "v1.x",
		dependencies = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},             -- Required
			{"williamboman/mason.nvim"},           -- Optional
			{"williamboman/mason-lspconfig.nvim"}, -- Optional

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},         -- Required
			{"hrsh7th/cmp-nvim-lsp"},     -- Required
			{"hrsh7th/cmp-buffer"},       -- Optional
			{"hrsh7th/cmp-path"},         -- Optional
			{"saadparwaiz1/cmp_luasnip"}, -- Optional
			{"hrsh7th/cmp-nvim-lua"},     -- Optional

			-- Snippets
			{"L3MON4D3/LuaSnip"},             -- Required
			{"rafamadriz/friendly-snippets"}, -- Optional
		}},
	{"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{"nvim-neo-tree/neo-tree.nvim", branch = "v2.x",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- Icons
			"MunifTanjim/nui.nvim",
		}
	}
}

-- NeoTree: remove legacy commands from NeoTreev1
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("lazy").setup(plugins)
