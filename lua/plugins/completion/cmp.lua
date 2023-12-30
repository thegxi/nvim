return function()
  local icons = {
		kind = require('plugins.util.icons').get('kind'),
		type = require('plugins.util.icons').get('type'),
		cmp = require('plugins.util.icons').get('cmp'),
	}
  -- Add additional capabilities supported by nvim-cmp
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local lspconfig = require('lspconfig')
  local servers = { 'bashls', 'clangd', 'jsonls', 'lua_ls', 'html' }
  

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup{
      -- on_attach = my custom on_attach
      capabilities = capabilities
    }
  end

  local cmp = require('cmp')

  require('cmp').setup({
    experimental = {
      ghost_text = true
    },
    formatting = {
      fields = { 'abbr', 'menu', 'kind' },
      format = function(entry, vim_item)
        local lspkind_icons = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp)
				-- load lspkind icons
				vim_item.kind =
					string.format(' %s  %s', lspkind_icons[vim_item.kind] or icons.cmp.undefined, vim_item.kind or "")

				vim_item.menu = setmetatable({
					cmp_tabnine = "[TN]",
					copilot = "[CPLT]",
					buffer = "[BUF]",
					orgmode = "[ORG]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[LUA]",
					path = "[PATH]",
					tmux = "[TMUX]",
					treesitter = "[TS]",
					latex_symbols = "[LTEX]",
					luasnip = "[SNIP]",
					spell = "[SPELL]",
				}, {
					__index = function()
						return "[BTN]" -- builtin/unknown source names
					end,
				})[entry.source.name]

				local label = vim_item.abbr
				local truncated_label = vim.fn.strcharpart(label, 0, 80)
				if truncated_label ~= label then
					vim_item.abbr = truncated_label .. "..."
				end

				return vim_item
			end,
    },
    mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-w>"] = cmp.mapping.close(),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require('luasnip').expand_or_locally_jumpable() then
          vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'))
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require('luasnip').jumpable(-1) then
          vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
      { name = 'path' },
    },
    window = {
      completion = {
        winhighlight = 'Normal:Pmenu,FlostBorder:Pmenu,Search:None',
        col_offset = -3,
        side_padding = 0,
        border = 'rounded',
        scrollbar = true
      },
      documentation = {
        winhighlight = 'Normal:Pmenu,FlostBorder:Pmenu,Search:None',
        border = 'rounded',
        scrollbar = true
      }
    }
  })
end
