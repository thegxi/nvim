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
   }
   local oj_attach = function(_, bufnr)
     -- Enable completion triggered by <c-x><c-o>
     local nmap = function(keys, func, desc)
       if desc then
         desc = 'LSP: ' .. desc
       end

       vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
     end

     nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
     nmap('gd', require "telescope.builtin".lsp_definition, '[G]oto [D]efinition')
     nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
     nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
     nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
     nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
     nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
     nmap('<leader>wl', function()
         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
     end, '[W]orkspace [L]ist Folders')
     nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
     nmap('<leader>rn', "<CMD>Lspsaga rename ++project<CR>", '[R]e[n]ame')
     nmap('<leader>ca', "<CMD>Lspsaga code_action<CR>", '[C]ode [A]ction')
     nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]iagnostics')
     nmap('gr', require('telescope.builtnn').lsp_references, '[G]oto [R]eferences')
     -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
     nmap("<space>f", function()
         vim.lsp.buf.format { async = true }
     end, "[F]ormat code")
     nmap("[d", vim.diagnostic.goto_prev, '[G]oto prev item')
     nmap("]d", vim.diagnostic.goto_prev, '[G]oto next item')
   end
   require("mason").setup()
   require("lspsaga").setup()
   require("neoconf").setup()
   require("neodev").setup()
   require("fidget").setup()
   require("mason-lspconfig").setup({
     ensure_installed = vim.tbl_keys(servers),
   })

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
