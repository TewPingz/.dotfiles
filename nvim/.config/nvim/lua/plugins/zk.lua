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
            require("zk").edit({ match = { value }, sort = { 'modified' }, hrefs = { "atomic", "literature", "fleeting" } })
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
        "<leader>zci",
        function()
          vim.ui.input({ prompt = "Clipboard Image Name: " }, function(title)
            if not title or title == "" then return end

            -- Destination directory
            local asset_dir = vim.fn.expand("~/notes/assets")
            vim.fn.mkdir(asset_dir, "p")

            -- Filename with extension
            local filename = title:match("%.png$") and title or (title .. ".png")
            local filepath = asset_dir .. "/" .. filename

            -- Save clipboard image (Linux xclip example)
            os.execute(string.format("xclip -selection clipboard -t image/png -o > %q", filepath))

            -- Insert Markdown image link
            local rel_path = string.format("../assets/%s", filename)
            vim.api.nvim_put({ string.format("![](%s)", rel_path) }, "l", true, true)

            vim.notify("Image saved to " .. filepath)
          end)
        end,
        desc = "Paste clipboard image into ~/notes/img/"
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
