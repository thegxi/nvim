return function()
  local nl = require("null-ls")
  local sources = {
      -- nl.builtins.formatting.beautysh,
      nl.builtins.formatting.black,
      nl.builtins.formatting.clang_format,
      nl.builtins.formatting.prettierd,
      -- nl.builtins.formatting.rustfmt,
      -- nl.builtins.formatting.sql_formatter,
  }
  nl.setup({
      sources = sources
  })
end
