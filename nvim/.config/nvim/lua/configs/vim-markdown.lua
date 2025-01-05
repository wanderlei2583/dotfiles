-- configs/vim-markdown.lua
local function setup()
	-- Configurações do vim-markdown
	vim.g.vim_markdown_folding_disabled = 1
	vim.g.vim_markdown_conceal = 0
	vim.g.vim_markdown_frontmatter = 1
	vim.g.vim_markdown_strikethrough = 1
	vim.g.vim_markdown_math = 1
	vim.g.vim_markdown_checkboxes = 1
	vim.g.vim_markdown_follow_anchor = 1
	vim.g.vim_markdown_toc_autofit = 1
end

return {
	setup = setup,
}
