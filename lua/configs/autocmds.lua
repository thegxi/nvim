vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "CookLazy" })
    end)
  end
})

-- 自定义懒加载事件
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  desc = "自定义事件LazyFile",
  pattern = "*",
  once = true,
  callback = function()
    if not vim.g._lazyfile_triggered then
      vim.g._lazyfile_triggered = true
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
      end)
    end
  end,
})

-- 取消自动换行注释
vim.api.nvim_create_autocmd("FileType", {
  desc = "取消自动换行注释",
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r" })
  end,
})
