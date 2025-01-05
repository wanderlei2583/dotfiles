return {
	{
		"preservim/vim-markdown",
		ft = "markdown",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.vim-markdown").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreview" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"lukas-reineke/headlines.nvim",
		ft = "markdown",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.headlines").setup()
		end,
	},
	{
		"ellisonleao/glow.nvim",
		ft = "markdown",
		cmd = "Glow",
		opts = {
			style = "dark",
			width = 120,
			height_ratio = 0.7,
			border = "rounded",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("configs.telescope")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.lazygit")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.gitsigns")
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		require("configs.todo"),
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.dashboard")
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.obsidian")
		end,
	},
	{
		"stevearc/oil.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.oil")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.lint")
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy",
		dependencies = { "nvim-lint" },
		config = function()
			require("configs.mason-lint")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lspconfig" },
		config = function()
			require("configs.mason-lspconfig")
		end,
	},
	{
		"zapling/mason-conform.nvim",
		event = "VeryLazy",
		dependencies = { "conform.nvim" },
		config = function()
			require("configs.mason-conform")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.treesitter")
		end,
	},

	{
		"nvim-lua/plenary.nvim",
	},
	{
		"Exafunction/codeium.vim",
		event = "VeryLazy",
		config = function()
			require("configs.codeium")
		end,
	},

	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.zenmode")
		end,
	},

	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			require("configs.vimtex")
		end,
	},

	{
		"micangl/cmp-vimtex",
		ft = "tex",
		config = function()
			require("cmp_vimtex").setup({})
		end,
	},

	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
