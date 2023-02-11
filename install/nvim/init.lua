require('one').setup {
    proxy = {
        github = 'https://ghproxy.com',
    },

    -- 使用:OneShowConfig 可查看部分暴露值
    --  简单修改部分 one.nvim Config 对象
    config = {
        pluginManager = { use = 'packer' }, -- 'vim-plug' or 'packer'
        treesitter = {
            ensure_installed = { "lua", "vim", "javascript", "typescript", "python" }
        },
        colors = require('my.colors').colors,
        rainbow = require('my.colors').rainbow,
        highlights = require('my.colors').highlights,
        statusline = require('my.statusline'),
        plugins = {
            {
                'stevearc/aerial.nvim',
                highlights = {
                    aerialline = { bg = '#36366a' },
                }
            },
        },

    },
    -- 函数修改部分 one.nvim Config 对象
    configFn = function()
        return {
            autopairs = require('my.autopairs'),
            floaterm = require('my.floaterm'),
            nullLS = require('my.null-ls')(),
            ['mason-installer'] = require("my.mason"),
        }
    end,
    --  完全重写插件原始的 Config
    plugins = {
        { 'nanozuki/tabby.nvim', config = require('my.tabby').config }
    },

}
