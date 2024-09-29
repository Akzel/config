return { "ibhagwan/fzf-lua",
	requires = { "echasnovski/mini.icons" },
	config = function()
		require("fzf-lua").setup({
			'fzf-native',
		})
	end,
	keys = {
		{"<C-x><C-f>",function() require("fzf-lua").complete_file({cmd = "rg --files", winopts = { preview = { hidden = false }}}) end, { silent = true, desc = "Fuzzy complete file", mode = "i" }},

		{"<leader>b", function() require("fzf-lua").buffers() end, desc = "Buffers"},
		{"<leader>k", function() require("fzf-lua").builtin() end, desc = "Builtin"},
		{"<leader>f", function() require("fzf-lua").files() end, desc = "Files"},
		{"<leader>l", function() require("fzf-lua").live_grep_glob() end, desc = "Live Grep"},
		{"<leader>g", function() require("fzf-lua").grep_project() end, desc = "Grep Project"},
		{"<leader>h", function() require("fzf-lua").help_tags() end, desc = "Help"},
	},
}
