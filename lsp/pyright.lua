local M = {}

M.cmd = { "pyright-langserver", "--stdio" }

M.filetypes = { "python" }

M.settings = {
  python = {
    analysis = {
      typeCheckingMode = "basic", -- off / basic / strict
    },
  },
}

return M
