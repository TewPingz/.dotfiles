local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
local opts = { noremap = true, silent = false }

if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
  map("n", "<leader>zl", "<Cmd>ZkInsertLink { tags = { 'atomic' } }<CR>", opts)
  map("v", "<leader>zl", ":'<,'>ZkInsertLinkAtSelection { tags = { 'atomic' } }<CR>", opts)
  map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
end
