local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
	"lua_ls",
	"clangd",
	"gopls",
	"pyright",
	"cssls",
	"ts_ls",
	"html",
	"jsonls",
	"eslint",
	"tailwindcss",
	"marksman",
	"prosemd_lsp",
	"vale_ls",
}

-- list of servers configured with default config.
local default_servers = {
	"pyright",
	"cssls",
	"ts_ls",
	"html",
	"jsonls",
	"eslint",
	"tailwindcss",
	"marksman",
	"prosemd_lsp",
	"vale_ls",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client, bufnr)
	end,
	on_init = on_init,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gotmpl", "gowork" },
	root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			completeUnimported = true,
			usePlaceholders = true,
			staticcheck = true,
		},
	},
})

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client, bufnr)
	end,
	on_init = on_init,
	capabilities = capabilities,
})

-- TypeScript/JavaScript (usando typescript-language-server)
lspconfig.ts_ls.setup({
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
	init_options = {
		hostInfo = "neovim",
		preferences = {
			importModuleSpecifierPreference = "relative",
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
})

-- Marksman (LSP principal para Markdown)
lspconfig.marksman.setup({
	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" },
	root_dir = lspconfig.util.root_pattern(".git", ".marksman.toml"),
	settings = {
		markdown = {
			-- Configurações específicas do Marksman
			formatter = {
				enabled = true,
				formatOnSave = true,
				lineLength = 80,
			},
			lint = {
				enabled = true,
				-- Regras personalizadas de linting
				rules = {
					"no-empty-links",
					"no-empty-images",
					"no-duplicate-headings",
				},
			},
		},
	},
})

-- Vale LSP (para linting de linguagem natural)
lspconfig.vale_ls.setup({
	filetypes = { "markdown", "rst", "tex", "text", "norg" },
	root_dir = lspconfig.util.root_pattern(".vale.ini"),
	cmd = { "vale-ls" },
	single_file_support = true,
})

-- HTML
lspconfig.html.setup({
	filetypes = { "html" },
})

-- CSS
lspconfig.cssls.setup({
	filetypes = { "css", "scss", "less" },
})

-- ESLint
lspconfig.eslint.setup({
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
})

-- Tailwind CSS (opcional, mas recomendado para projetos Next.js)
lspconfig.tailwindcss.setup({
	filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- JSON
lspconfig.jsonls.setup({
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = { ".eslintrc.json", ".eslintrc" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{
					fileMatch = { "next.config.json" },
					url = "https://json.schemastore.org/next.config.json",
				},
			},
			-- Enable/disable default JSON formatter
			format = { enabled = true },
			-- Validate on save
			validate = { enable = true },
		},
	},
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,

	settings = {
		Lua = {
			diagnostics = {
				enable = false, -- Disable all diagnostics from lua_ls
				-- globals = { "vim" },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					"${3rd}/love2d/library",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})
