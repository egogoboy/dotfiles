local vim = vim

return {
    --[[
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
            transparent = {
                bg = true,
            },
            visual = {
                theme = 'light',
            },
            on_palette = function(palette)
                palette.black0 = "#1E1E1E"
            end,
        })

        vim.cmd("colorscheme nordic")
    end
    ]] --

    'folke/tokyonight.nvim',
    config = function()
        vim.cmd("colorscheme tokyonight-night")
    end
}
