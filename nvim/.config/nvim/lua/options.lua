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
