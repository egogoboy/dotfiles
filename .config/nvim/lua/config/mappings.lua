vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- // Neo-tree // --
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })

-- // LSP // --
on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]e", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
end
