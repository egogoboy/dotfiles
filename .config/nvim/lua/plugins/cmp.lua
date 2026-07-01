return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args) require("luasnip").lsp_expand(args.body) end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" })
            }),
            sources = {
                { name = "nvim_lsp" },
            },
            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpCursorLine,Search:None",
                },
                documentation = {
                    border = "rounded",
                    winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder,CursorLine:CmpDocCursorLine",
                },
            },
        })
        vim.api.nvim_set_hl(0, "CmpCursorLine", { link = "PmenuSel" })
    end
}
