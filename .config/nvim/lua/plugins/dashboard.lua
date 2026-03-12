local function def_header()
    return {
        '', '', '', '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '',
        '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
        '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
        '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
        '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
        '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
        '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
        ''
    }
end

return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'doom',
            config = {
                header = def_header(),
                center = {
                }
            },
            packages = { enable = false }, -- show how many plugins neovim loaded
            -- limit how many projects list, action when you press key or enter it will run this action.
            -- action can be a function type, e.g.
            -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
            project = { enable = false, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
            mru = { enable = false, limit = 10, icon = 'your icon', label = '', cwd_only = false },
            footer = {}, -- footer
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
