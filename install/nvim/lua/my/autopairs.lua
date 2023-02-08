local cmp = require('cmp')
local handlers = require('nvim-autopairs.completion.handlers')
return {
	opts = { map_cr = true },
	confirm = {
		filetypes = {
			['*'] = {
				['('] = {
					kind = {
						cmp.lsp.CompletionItemKind.Function,
						cmp.lsp.CompletionItemKind.Method
					},
					handler = handlers['*'],
				},
			}
		}
	}
}
