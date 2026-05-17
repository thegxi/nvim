-- Oil
require("oil").setup()
local function toggle_oil()
  local bufname = vim.api.nvim_buf_get_name(0)
  if vim.bo.filetype == "oil" then
    require("oil").close()
  else
    require("oil").open()
  end
end
vim.keymap.set("n", "<leader>e", function()
  toggle_oil()
end, { desc = "Toggle Oil" })
