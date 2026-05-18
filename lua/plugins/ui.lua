local map = vim.keymap.set

-- devicons
vim.api.nvim_create_autocmd("User", {
	pattern = "CookLazy",
	callback = function()
		require("nvim-web-devicons")
	end,
})

--bufferline
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyFile",
	callback = function()
		require("bufferline").setup({})
		map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "切换到下一个缓冲区" })
		map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "切换到上一个缓冲区" })
		map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "快速切换缓冲区" })
		map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "删除缓冲区" })
		map("n", "<leader>bf", "<cmd>BufferLinePick<cr>", { desc = "查询并跳转缓冲区" })
		map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "删除其他缓冲区" })
		map("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "切换缓冲区固定状态" })
		map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", { desc = "删除未固定的缓冲区" })
	end,
})
