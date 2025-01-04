local keywords = 'YouTube,Youtube,URL,Url'
local todo = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },

  keys = {
    { "<leader>fy", "<cmd>TodoTelescope keywords="..keywords.."<cr>" },
  },
  opts = {
    signs = true,
    keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      YouTube = { icon = " ", color = "#ff0000", alt = { "youtube", "Youtube" } },
      URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
      GitHub = { icon = " ", color = "#dedede", alt = { "Github", "github" } },
      Email = { icon = " ", color = "#fff000", alt = { "Email", "email" } },
      Slack = { icon = " ", color = "#FFf855", alt = { "Slack", "slack" } },
      SlackMention = { icon = " ", color = "#090909", alt = { "Slack", "slack" } },
    },
    gui_style = {
      fg = "NONE",
      bg = "BOLD",
    },
  },
}

return todo
