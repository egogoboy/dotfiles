return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                cpp = { "clangd-format" },
                python = { "isort" },
            },
            format_on_save = function(bufnr)
                local ignore_filetypes = { "sql", "markdown" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
        })
    end
}
