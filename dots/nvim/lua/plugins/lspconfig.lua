return {
	{ 'hrsh7th/nvim-cmp' },
	{
		'lukas-reineke/lsp-format.nvim',
		config = function()
			require("lsp-format").setup {}
		end
	},

	{
		"neovim/nvim-lspconfig",
		cmd = 'Mason',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			"williamboman/mason.nvim",
			'hrsh7th/cmp-nvim-lsp',
			"folke/lazydev.nvim",
			{ "williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason").setup()
					require("mason-lspconfig").setup()
					require("mason-lspconfig").setup_handlers {
						function (server_name)
							require("lspconfig")[server_name].setup {
								capabilities = require('cmp_nvim_lsp').default_capabilities(),
							}
						end,
					}
				end },
		},
	},
	--- lua stuff
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0,
			})
		end,
	},
}
