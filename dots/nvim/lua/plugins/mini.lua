return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()
		require('mini.files').setup {
			windows = {
				preview = true,
				max_number = 2,
				width_focus = 30,
				width_nofocus = 10,
				width_preview = 70,
			},
			vim.keymap.set('n','-', function(...)
				if not MiniFiles.close() then MiniFiles.open(...) end
			end)
	}

	local statusline = require 'mini.statusline'
	statusline.setup { use_icons = vim.g.have_nerd_font }
	end,
}
