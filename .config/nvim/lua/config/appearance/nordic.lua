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
