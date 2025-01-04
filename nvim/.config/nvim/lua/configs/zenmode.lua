local zen = {
  {
    keys = { "<Leader>zz", "<cmd>ZenMode<CR>", noremap = true, desc = "Zen Mode" },
    opts = {
      plugins = {
        gitsigns = { enabled = true },
        tmux = { enabled = vim.env.TMUX ~= nil },
      },
    },
  },
}
require("zen-mode").setup(zen)
