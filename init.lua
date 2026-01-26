-- 设置空格为Leader键
vim.g.mapleader = " "

require("config.options")
require("config.lazy")
require("config.keymap")

vim.lsp.enable "lua_ls"
vim.lsp.enable "jdtls"
vim.lsp.enable "html"
