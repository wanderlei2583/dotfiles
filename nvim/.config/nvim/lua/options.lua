require("nvchad.options")

local o = vim.o
local autocmd = vim.api.nvim_create_autocmd

o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.cursorlineopt = "both"
o.relativenumber = true
o.spelllang = "pt_br"

autocmd("BufWritePre", {
	pattern = ".go",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Configurações específicas para Markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_checkboxes = 1
