local vim = vim

-- // BASIC EDITOR CONFIG // --

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")

-- // LAZY NVIM // --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- // LEADER KEY // --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- // LAZY NVIM SETUP // --

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "nordic" } },
})

-- // NEO-TREE MAPPING // --

vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })

-- // LSP // --


vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

vim.o.updatetime = 300 -- 0.3 секунды ожидания
