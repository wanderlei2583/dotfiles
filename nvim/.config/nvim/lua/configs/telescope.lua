local opts = {

	vim.api.nvim_create_user_command("TelescopeApp", function()
		require("telescope.builtin").find_files({
			prompt_title = "Aplicativos",
			cwd = "/usr/share/applications",
			file_ignore_patterns = { "^[.]" },
			find_command = { "find", ".", "-type", "f", "-name", "*.desktop" },
		})
	end, {}),

	vim.api.nvim_create_user_command("TelescopeDotfiles", function()
		require("telescope.builtin").find_files({
			prompt_title = "Dotfiles",
			cwd = vim.fn.expand("~/dotfiles/"),
			hidden = true,
			file_ignore_patterns = { ".git/*", "node_modules/*" },
		})
	end, {}),
}

require("telescope").setup(opts)
