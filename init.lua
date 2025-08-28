vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.neovide then
  require("neovide.neovide")
end

require 'config.options'
require 'config.lazy'
require 'config.keymapping'


