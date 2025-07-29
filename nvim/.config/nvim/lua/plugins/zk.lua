return {
  {
    "zk-org/zk-nvim",
    dependencies = {
      "folke/snacks.nvim"
    },
    cmd = { 'ZkNew', 'ZkNotes', 'ZkInsertLink', 'ZkInsertLinkAt', 'ZkBacklinks' },
    opts = {
      picker = "snacks_picker",

      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },

        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    },
    keys = {
      {
        "<leader>zn",
        function()
          vim.ui.input({ prompt = "Note Title: " }, function(title)
            if not title or title == "" then return end
            vim.ui.select({ "Fleeting", "Literature", "Atomic" }, { prompt = "Note Type: " }, function(template)
              if not template or template == "" then return end
              require("zk").new({ title = title, dir = string.lower(template) })
            end)
          end)
        end,
        desc = "Create a new Zk note with a specific template"
      },

      {
        "<leader>zo",
        "<Cmd>ZkNotes { sort = { 'modified' }, hrefs = { 'atomic', 'literature' } }<CR>",
        desc = "Search through the recently modified zettelkasten notes",
      },

      {
        "<leader>zf",
        function()
          vim.ui.input({ prompt = "Search: " }, function(value)
            if not value or value == "" then return end
            require("zk").edit({ match = { value }, sort = { 'modified' }, hrefs = { "atomic", "literature" } })
          end)
        end,
        desc = "Grep through zettelkasten notes.",
      },

      {
        "<leader>zt",
        "<Cmd>ZkTags { hrefs = { 'atomic', 'literature' } }<CR>",
        desc = "Search through the tags used for the zettelkasten notes.",
      },

      {
        "<leader>jd",
        "<Cmd>ZkNew { dir = 'journal' }<CR>",
        desc = "Create a new journal note."
      },

      {
        "<leader>jo",
        "<Cmd>ZkNotes { tags = { 'daily' }, sort = { 'modified' } }<CR>",
        desc = "Search through the notes that have daily tag",
      },
    },
    config = function(_, opts)
      require("zk").setup(opts)
    end
  }
}
