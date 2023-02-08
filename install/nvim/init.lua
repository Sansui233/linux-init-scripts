require('one').setup {
    configFn = function()
        return {
            autopairs = require('my.autopairs')
        }
    end,
    config = {
        pluginManager = { use = 'packer' }, -- 'vim-plug' or 'packer'
        ['mason-installer'] = {
            ensure_installed = {
                'lua-language-server'
            },
        },
        treesitter = {
            ensure_installed = { "lua", "vim" }
        },
        colors = require('my.colors').colors,
        rainbow = require('my.colors').rainbow,
        highlights = require('my.colors').highlights,
        statusline = {
            lualine = {
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
        },
        plugins = {
            {
                'stevearc/aerial.nvim',
                highlights = {
                    AerialLine = { bg = '#36366a' },
                }
            },
        },

    },
}
