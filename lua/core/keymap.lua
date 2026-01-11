vim.keymap.set('n', '<leader>bl', ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bn', ':lua require("buffer_manager.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':lua require("buffer_manager.ui").nav_prev()<CR>', { noremap = true, silent = true })
