local vim = vim

require('config.base')
require('config.mappings')
require('config.lazy')
require('config.lsp-format')
require('config.autopairs')
require('config.cmp')
require('config.telescope')
-- require('config.treesitter')

-- // APPEARANCE // --

require('config.appearance')


-- // LSP // --

vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('xmlformatter')

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

vim.o.updatetime = 300 -- 0.3 секунды ожидания
