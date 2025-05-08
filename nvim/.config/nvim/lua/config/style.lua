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

vim.opt.foldenable = true -- enable folding
vim.opt.foldmethod = "indent" -- or "manual", "marker", "syntax", etc.
vim.opt.foldlevel = 99 -- open all folds by default
