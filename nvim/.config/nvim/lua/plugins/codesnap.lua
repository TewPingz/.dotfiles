return {
	"mistricky/codesnap.nvim",
	build = "make build_generator",
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
	},
	opts = {
		has_breadcrumbs = false,
		has_line_number = true,
		mac_window_bar = false,
		bg_padding = 0,
		watermark = "",
	},
}
