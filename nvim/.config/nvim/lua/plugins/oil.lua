return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, bufnr)
            return name == ".git"
          end,
        },
      })
      vim.keymap.set("n", "<leader>pv", require("oil").open, { desc = "Open Oil.nvim" })
    end
  }
}
