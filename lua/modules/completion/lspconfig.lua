return function()
  require("mason").setup({
    ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
    }
  })

  local servers = {
    "bashls",
    "clangd",
    "pyright",
    "rust_analyzer"
  }

  require("mason-lspconfig").setup({
    ensure_installed = servers
  })

  local on_attach = function(client, bufnr)
     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
 
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
    end, bufopts)
 
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end,
        })
    end
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local nvim_lsp = require("lspconfig")
  
  -- bash
  nvim_lsp.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
  -- clang
  nvim_lsp.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
  -- python
  nvim_lsp.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
  -- rust
  nvim_lsp.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
  -- css
  nvim_lsp.cssls.setup({
    capabilities = capabilities;
    on_attach = on_attach;
  })
  -- html
  nvim_lsp.html.setup({
    capabilities = capabilities;
    on_attach = on_attach;
  })
  -- java
  nvim_lsp.jdtls.setup({
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "OpenJDK-17",
              path = "/usr/lib/jvm/java-17-openjdk",
              default = true,
            }
          }
        }
      }
    }
  })
end
