return function()
   local servers = {
     lua_ls = {
       Lua = {
         settings = {
           workspace = { checkThirdParty = false },
           telemetry = { enable = false },
         }
       },
     },
     pyright = {},
     jsonls = {},
     marksman = {},
     dockerls = {},
     docker_compose_language_service = {},
     bashls = {},
     html = {},
   }
   local on_attach = function(_, bufnr)
     -- Enable completion triggered by <c-x><c-o>
     local customMap = function(keys, func, desc)
       if desc then
         desc = 'LSP: ' .. desc
       end

       vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
     end

     customMap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
     customMap('gd', require "telescope.builtin".lsp_definition, '[G]oto [D]efinition')
     customMap('K', vim.lsp.buf.hover, 'Hover Documentation')
     customMap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
     customMap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
     customMap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
     customMap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
     customMap('<leader>wl', function()
         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
     end, '[W]orkspace [L]ist Folders')
     customMap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
     customMap('<leader>rn', "<CMD>Lspsaga rename ++project<CR>", '[R]e[n]ame')
     customMap('<leader>ca', "<CMD>Lspsaga code_action<CR>", '[C]ode [A]ction')
     customMap('<leader>da', require "telescope.builtin".diagnostics, '[D]iagnostics')
     customMap('gr', require('telescope.builtnn').lsp_references, '[G]oto [R]eferences')
     -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
     customMap("<space>f", function()
         vim.lsp.buf.format { async = true }
     end, "[F]ormat code")
     customMap("[d", vim.diagnostic.goto_prev, '[G]oto prev item')
     customMap("]d", vim.diagnostic.goto_prev, '[G]oto next item')
   end
   require("mason").setup()
   require("lspsaga").setup()
   require("neoconf").setup()
   require("neodev").setup()
   require("fidget").setup()
   require("mason-lspconfig").setup({
     ensure_installed = vim.tbl_keys(servers),
   })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  for server,config in pairs(servers) do
    require("lspconfig")[server].setup(
      vim.tbl_deep_extend('keep',
        {
          on_attach = on_attach,
          capabilities = capabilities
        },
        config
      )
    )
  end
end
