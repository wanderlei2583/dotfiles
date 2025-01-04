return {
	init = function()
		--global vimtex settings
		vim.g.vimtex_imaps_enabled = 0 --i.e., disable them
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_method = "latexrun"
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
		vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
		vim.g.vimtex_quickfix_ignore_filters = {
			"Underfull",
			"Overfull",
			"LaTeX Warning: .\\+ float specifier changed to",
			"Package hyperref Warning: Token not allowed in a PDF string",
		}
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-pdf",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}
	end,
}
