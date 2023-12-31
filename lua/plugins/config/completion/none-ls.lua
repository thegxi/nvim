return function()
  local null_ls = require('null-ls')

  ---Return formatter args required by `extra_args`
	---@param formatter_name string
	---@return table|nil
	local function formatter_args(formatter_name)
    args = { "-style={BasedOnStyle: LLVM, IndentWidth: 4}" }
    return args
	end

  null_ls.setup({
    border = 'rounded',
    debug = false,
    log_level = 'warn',
    update_in_insert = false,
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
      null_ls.builtins.formatting.clang_format.with({
        filetypes = { 'c', 'cpp' },
        extra_args = formatter_args('clang_format')
      }),
      null_ls.builtins.formatting.prettier.with({
        'vue',
				'typescript',
				'javascript',
				'typescriptreact',
				'javascriptreact',
				'yaml',
				'html',
				'css',
				'scss',
				'sh',
				'markdown',
        'text'
      }),
      null_ls.builtins.formatting.rustfmt
    }
  })
end
