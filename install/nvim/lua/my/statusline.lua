return {
	lualine = {
		lualineConfig = {
			options = {
				disabled_filetypes = {
					statusline = { 'alpha' },
					winbar = { 'alpha', 'aerial', 'neo-tree', 'nerdtree', 'NvimTree', 'term' },
				},
			}
		},
		winbar = {
			lualine_c = {
				{
					'aerial',
					sep = ' > ',
					depth = nil,
					dense = false,
					dense_sep = '.',
					colored = true,
					color = { fg = '#9ac3de', bg = require('my.colors').grey1, gui = 'bold' },
				},
			}
		}
	}
}
