return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,

        config = function()
            require("onedark").setup({
                style = "dark",
                transparent = true,

                code_style = {
                    comments = "italic",
                    keywords = "bold",
                    functions = "italic",
                    strings = "none",
                    variables = "italic",
                },

                lualine = {
                    transparent = true,
                },
            })

            require("onedark").load()
        end,
    },
}
