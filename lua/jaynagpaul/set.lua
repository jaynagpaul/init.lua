local vim = vim

-- FOLD Settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.wo.number = true
vim.wo.relativenumber = true
