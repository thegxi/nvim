-- 打开数据库UI界面
vim.keymap.set("n", "<leader>du", "<CMD>DBUI<CR>", { desc = "打开数据库 UI" })

-- 执行当前行或选中区的sql
vim.keymap.set("n", "<leader>ds", ":DB<CR>", { desc = "执行sql" })
vim.keymap.set("v", "<leader>ds", ":'<,'>DB<CR>", { desc = "执行选中sql" })

