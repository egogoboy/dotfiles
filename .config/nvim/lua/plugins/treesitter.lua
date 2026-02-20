return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    config = function()
        require 'nvim-treesitter'.setup {
            ensure_installed = { "c", "cpp", "java", "python", "lua" },
            highlight = {
                enable = true, additional_vim_regex_highlighting = false
            },
            indent = { enable = true },
            incremental_selection = { enable = true },
            refactor = {
                highlight_definitions = { enable = true },
                smart_rename = { enable = true }
            }
        }
    end,
}
