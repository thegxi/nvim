return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- 函数详细提示
  settings = {
    Lua = {
      workspace = {
        library = {
          vim.env.VIMRUNTIME
        }
      }
    }
  }
}
