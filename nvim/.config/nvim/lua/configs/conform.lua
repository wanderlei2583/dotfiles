local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "marksman" },
		css = { "prettier" },
		html = { "prettier" },
		c_cpp = { "clang-format" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		go = { "gofumpt", "goimports-reviser", "golines" },
		python = { "isort", "black" },
	},
	formatters = {
		["goimports-reviser"] = {
			prepend_args = { "-set-alias", "-format", "-recursive" },
		},
		golines = {
			prepend_args = { "--max-len=80" },
		},
		-- Python
		black = {
			prepend_args = {
				"--fast",
				"--line-length",
				"80",
			},
		},
		isort = {
			prepend_args = {
				"--profile",
				"black",
			},
		},
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
