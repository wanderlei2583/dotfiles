-- configs/markdown-preview.lua
local function setup()
	-- Configuração dos keymaps para preview
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "markdown",
		callback = function()
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(0, "n", "<leader>mp", "<cmd>MarkdownPreview<CR>", opts)
		end,
	})
end

return {
	setup = setup,
}
