-- Oil
require("oil").setup({
    columns = {
        "icon"
    },
    win_options = {
        cursorline = true,
        signcolumn = "no",
        wrap = false,
        list = false,
        conceallevel = 3
    }
})
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
