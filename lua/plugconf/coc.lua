local COC = {}

function COC.config()
  vim.g.coc_global_extensions = {
    'coc-marketplace',
    'coc-tsserver',
    'coc-json',
    'coc-html',
    'coc-css',
    'coc-clangd',
    'coc-go',
    'coc-lua',
    'coc-vimlsp',
    'coc-sh',
    'coc-db',
    'coc-java',
    'coc-pyright',
    'coc-prettier',
    'coc-snippets',
    'coc-pairs',
    'coc-translator',
    'coc-git',
  }
  vim.api.nvim_command('autocmd FileType javascript,typescript,json vmap <buffer> = <Plug>(coc-format-selected)')
  vim.api.nvim_command('autocmd FileType javascript,typescript,json nmap <buffer> = <Plug>(coc-format-selected)')
  vim.api.nvim_command("command! -nargs=? Fold :call CocAction('fold', <f-args>)")
  vim.api.nvim_command("hi! link CocPum Pmenu")
  vim.api.nvim_command("hi! link CocMenuSel PmenuSel")

end

return COC
