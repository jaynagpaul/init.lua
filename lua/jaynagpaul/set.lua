local vim = vim

-- Fold Settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Number Settings
vim.wo.number = true
vim.wo.relativenumber = true
