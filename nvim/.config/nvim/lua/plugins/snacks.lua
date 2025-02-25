return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {
        enabled = true
      },
      dashboard = {
        enabled = true,
      },
      input = {
        enabled = true
      },
      picker = {
        enabled = true,
        layout = {
          preset = "ivy",
        }
      },
      notifier = {
        enabled = true
      },
      quickfile = {
        enabled = true
      },
      scope = {
        enabled = true
      },
      scroll = {
        enabled = true
      },
      statuscolumn = {
        enabled = true
      },
      words = {
        enabled = true
      },
      lazygit = {
        enabled = true
      },
    },
    keys = {
      { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
      { "<leader>en",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
      { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
      { "<leader>fd",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
      { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
    },
  }
}
