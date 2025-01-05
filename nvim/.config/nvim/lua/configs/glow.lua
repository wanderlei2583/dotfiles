local M = {}

function M.setup()
	require("glow").setup({
		style = "dark",
		border = "rounded",
		width = 120,
		height_ratio = 0.7,
	})
end

return M
