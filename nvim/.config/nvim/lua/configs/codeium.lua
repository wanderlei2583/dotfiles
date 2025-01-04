local options = {
	vim.keymap.set("i", "<C-g>", function()
		return vim.fn["codeium#Accept"]()
	end, { expr = true, silent = true, desc = "Aceitar Sugestão." }),
	vim.keymap.set("i", "<C-x>", function()
		return vim.fn["codeium#Clear"]()
	end, { expr = true, silent = true, desc = "Codeium Clear" }),
	vim.keymap.set("i", "<C-]>", function()
		return vim.fn["codeium#CycleCompletions"](1)
	end, { expr = true, silent = true, desc = "Codeium Cycle Completions Next" }),
}
return options
