local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if ok_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

ON_ATTACH = function(_, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "K", vim.lsp.buf.hover, "Hover info")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, "Show references")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")

    map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics")
    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
end

vim.cmd('highlight DiagnosticUnderlineError gui=undercurl guisp=Red')
vim.cmd('highlight DiagnosticUnderlineWarn gui=undercurl guisp=Orange')
vim.cmd('highlight DiagnosticUnderlineInfo gui=undercurl guisp=Blue')
vim.cmd('highlight DiagnosticUnderlineHint gui=undercurl guisp=Green')

vim.diagnostic.config({

    underline = true,
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = "ඞ",
            [vim.diagnostic.severity.WARN]  = "ඞ",
            [vim.diagnostic.severity.HINT]  = "ඞ",
            [vim.diagnostic.severity.INFO]  = "ඞ",
        },
    },
    virtual_text = false,
    float = {
        border = "single",
        format = function(diagnostic)
            return string.format(
                "%s (%s) [%s]",
                diagnostic.message,
                diagnostic.source,
                diagnostic.code or diagnostic.user_data.lsp.code
            )
        end,
    },
})
