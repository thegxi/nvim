vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "CookLazy" })
    end)
  end
})
