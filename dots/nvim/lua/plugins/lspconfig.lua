return {
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{
	'lukas-reineke/lsp-format.nvim',
	config = function()
		require("lsp-format").setup {}
	end
	},
	{ 
	'neovim/nvim-lspconfig',
	config = function ()
		local lspconfig = require("lspconfig")
		lspconfig.nil_ls.setup {
			autostart = true,
				  on_attach = 	require("lsp-format").on_attach,
		}
		lspconfig.lua_ls.setup {
			on_init = function(client)
				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						workspace = {
						library = {
						vim.env.VIMRUNTIME
						}
						}
						})
			end,
				on_attach = require("lsp-format").on_attach,
				settings = {
					Lua = {}
				}
		}
	end}
}
