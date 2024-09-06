return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()
		require('mini.files').setup {
			opts = {
				windows = {
					preview = true,
					width_focus = 30,
					width_preview = 30,
				},
			},
			vim.keymap.set('n','-', function(...)
				if not MiniFiles.close() then MiniFiles.open(...) end
			end)
	}

	local statusline = require 'mini.statusline'
	statusline.setup { use_icons = vim.g.have_nerd_font }
	statusline.section_location = function()
		return '%2l:%-2v'
	end
end,
}
