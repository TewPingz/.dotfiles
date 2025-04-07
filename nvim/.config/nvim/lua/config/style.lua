-- Spacing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Relative line numbers in file
vim.opt.number = true
vim.opt.relativenumber = true

vim.diagnostic.config({
  virtual_text = true, -- set to false to disable inline errors
})
