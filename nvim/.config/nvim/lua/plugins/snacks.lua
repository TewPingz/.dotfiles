return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = {
				enabled = true,
			},
			dashboard = {
				enabled = true,
			},
			input = {
				enabled = true,
			},
			picker = {
				enabled = true,
				layout = {
					preset = "ivy",
				},
			},
			notifier = {
				enabled = true,
			},
			quickfile = {
				enabled = true,
			},
			scope = {
				enabled = true,
			},
			scroll = {
				enabled = true,
			},
			statuscolumn = {
				enabled = true,
			},
			words = {
				enabled = true,
			},
			lazygit = {
				enabled = true,
			},
		},
		keys = {
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>en",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files({ hidden = true })
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
		},
	},
}
