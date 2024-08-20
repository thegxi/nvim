return function()
  require("toggleterm").setup({
    size = 40,
    open_mapping = [[<c-\>]],
    hide_numbers = false,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 3,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      border = "single",
      width = 300,
      height = 100,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })
  -- toggleterm
  -- lazygit and tig
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
  })
  function _lazygit_toggle()
    lazygit:toggle()
  end

  vim.api.nvim_set_keymap(
    "n",
    "<leader>gg",
    "<cmd>lua _lazygit_toggle()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<leader>gt",
    "<cmd>TermExec cmd='tig %' go_back=1 direction=float<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<leader>gb",
    "<cmd>TermExec cmd='tig blame %' go_back=1 direction=float<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap("t", "<c-q>", "<cmd>bd!<cr>", { noremap = true, silent = true })
end
