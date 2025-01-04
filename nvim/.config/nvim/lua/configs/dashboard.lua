local opts = {
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = "󰊳 Atualizar", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Arquivos",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Aplicativos",
				group = "DiagnosticHint",
				action = "TelescopeApp",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "TelescopeDotfiles",
				key = "d",
			},
		},
	},
}

require("dashboard").setup(opts)
