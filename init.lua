vim.g.mapleader = " "
require("config.options")
require("config.lazy")
require("config.keymap")
require("config.lsp")

vim.lsp.enable ("lua_ls")
vim.lsp.enable ("html")
vim.lsp.enable ("jdtls")

