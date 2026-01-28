vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    -- 设置一些快捷键，你可以使用这些快捷键进行LSP有关的操作
    -- 你需要安装 Telescope
    map("grn", vim.lsp.buf.rename, "[R]ename")
    map("grs", require("telescope").extensions.aerial.aerial, "LSP Symbols")
    map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
    map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
    map("grw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
    map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
    map("grh", vim.lsp.buf.hover, "Hover")
    local function client_supports_method(client, method, bufnr) return client:supports_method(method, bufnr) end

    -- 自动高亮你光标下内容的引用，并在光标移动时清除
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client.name == 'jdtls' then
      map("<a-cr>", function()
        vim.lsp.buf.code_action({
          filter = function(action)
            return action.title:find("Import") ~= nil
          end
        })
      end, "Custom Import", { "n", "i" })
    end
    if
      client
      and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
    then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds {
            group = "lsp-highlight",
            buffer = event2.buf,
          }
        end,
      })
    end

    -- 创建一个快捷键，以便切换是否启用 Inlay Hints（如果可用）
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      vim.lsp.inlay_hint.enable(true) -- 默认启用，你可以把它改为false
      vim.keymap.set("n", "<leader>uh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        if vim.lsp.inlay_hint.is_enabled { bufnr = event.buf } then
          vim.notify("Inlay hints: " .. "ON")
        else
          vim.notify("Inlay hints: " .. "OFF")
        end
      end, { desc = "Toggle Inlay Hints" })
    end
  end,
})

-- 诊断信息设置
-- 查看 :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ", -- 这里配置“错误”的图标，需要nerd font字体
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- 下面这一堆是跳转到诊断信息的快捷键
vim.keymap.set(
  "n",
  "[h",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.HINT, count = -1 } end,
  { desc = "Previous hint" }
)
vim.keymap.set(
  "n",
  "]h",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.HINT, count = 1 } end,
  { desc = "Next hint" }
)
vim.keymap.set(
  "n",
  "[i",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.INFO, count = -1 } end,
  { desc = "Previous info" }
)
vim.keymap.set(
  "n",
  "]i",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.INFO, count = 1 } end,
  { desc = "Next info" }
)
vim.keymap.set(
  "n",
  "[w",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.WARN, count = -1 } end,
  { desc = "Previous warning" }
)
vim.keymap.set(
  "n",
  "]w",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.WARN, count = 1 } end,
  { desc = "Next warning" }
)
vim.keymap.set(
  "n",
  "[e",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, count = -1 } end,
  { desc = "Previous error" }
)
vim.keymap.set(
  "n",
  "]e",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, count = 1 } end,
  { desc = "Next error" }
)

-- 当光标处有诊断信息时自动显示
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
      border = "rounded",
      scope = "cursor",
    })
  end,
})
