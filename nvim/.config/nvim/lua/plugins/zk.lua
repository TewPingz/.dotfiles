return {
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",

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
      vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: '), template = vim.fn.input('Template: ').md }<CR>", opts)
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
