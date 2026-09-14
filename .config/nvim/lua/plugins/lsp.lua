return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = {
                    'jdtls'
                }
            },
            ensure_installed = {
                'clangd'
            },
        },
        handlers = {
            function(server_name)
                local capabilities = vim.lsp.protocol.make_client_capabilities()

                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ["clangd"] = function()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                require("lspconfig").clangd.setup({
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--clang-tidy",
                        "--background-index",
                    },
                })
            end,
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre"
    },

    {
        'mfussenegger/nvim-jdtls',
        ft = { 'java' },
    },

}
