require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Abrir diretório atual." })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>q", "<cmd> wqa <cr>", { desc = "Fechar e Salvar tudo." })
map("n", "<leader>Q", "<cmd> qa <cr>", { desc = "Fechar tudo." })
map("n", "<leader>h", "<cmd> noh <cr>", { desc = "Limpar Highlight" })
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Preview Markdown" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop Markdown" })

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
map("n", "<leader>gf", "<cmd>LazyGitFilterCurrentFile<cr>", { desc = "LazyGitFilterCurrentFile" })

-- Latex comandos com vimtex
map("n", "<leader>lc", "<cmd>VimtexClean<cr>", { desc = "Limpar Latex" })
map("n", "<leader>ll", "<cmd>VimtexCompile<cr>", { desc = "Compilar Latex" })
map("n", "<leader>lp", "<cmd>VimtexStop<cr>", { desc = "Parar Latex" })
map("n", "<leader>la", "<cmd>!pdflatex %<cr>", { desc = "Compilar Latex" })
map("n", "<leader>lo", "<cmd>!open %<cr>", { desc = "Abrir PDF" })
