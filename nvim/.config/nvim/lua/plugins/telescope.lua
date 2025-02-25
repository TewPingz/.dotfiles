return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {}
        },
        defaults = {
          layout_strategy = 'bottom_pane',
          sorting_strategy = 'ascending',
          layout_config = {
            height = 25,
          },
          border = true,
          borderchars = {
            prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
            results = { " " },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
        }
      }

      require('telescope').load_extension('fzf')
    end
  }
}
