return {
  {
    "TewPingz/zk-nvim",
    branch = "picker_options",
    config = function()
      require("zk").setup({
        picker = "snacks_picker",

        picker_options = {
          snacks_picker = {
            layout = {
              preset = "ivy",
            },
          }
        },

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
      })

      local opts = { noremap = true, silent = false }

      vim.api.nvim_set_keymap("n", "<leader>zn", "", {
        callback = function()
          vim.ui.input({ prompt = "Note Title: " }, function(title)
            if not title or title == "" then return end
            vim.ui.select({ "Fleeting", "Literature", "Permanent" }, { prompt = "Note Type: " }, function(template)
              if not template or template == "" then return end
              require("zk").new({ title = title, template = string.lower(template) .. ".md" })
            end)
          end)
        end
      })

      vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>zf",
        "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
      vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>zl", "<Cmd>ZkInsertLink { tags = { 'permanent' } }<CR>", opts)
      vim.api.nvim_set_keymap("v", "<leader>zl", ":'<,'>ZkInsertLinkAtSelection { tags = { 'permanent' } }<CR>", opts)
    end
  }
}
