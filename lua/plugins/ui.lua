local map = vim.keymap.set

-- devicons
vim.api.nvim_create_autocmd("User", {
  pattern = "CookLazy",
  callback = function()
    require("nvim-web-devicons")
  end
})
