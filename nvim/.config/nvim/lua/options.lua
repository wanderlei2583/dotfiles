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

-- Italics
vim.opt.termguicolors = true -- Certifique-se de que as cores do terminal estão habilitadas
-- Configuração de itálico para grupos de destaque
vim.api.nvim_set_hl(0, "Comment", { italic = true }) -- Exemplo: Comentários em itálico
vim.api.nvim_set_hl(0, "String", { italic = true }) -- Exemplo: Strings em itálico
