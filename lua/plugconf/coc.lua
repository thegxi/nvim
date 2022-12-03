local cocKeyMap = require("keybinding").cocKeyMap

local COC = {}
local keymap = vim.api.nvim_set_keymap

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

  keymap("n", "<F2>", "<Plug>(coc-rename)", {silent = true})
  keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
  keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
  keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
  keymap("n", "gr", "<Plug>(coc-references)", {silent = true}) 
  keymap("x", "if", "<Plug>(coc-funcobj-i)", {silent = true}) 
  keymap("o", "if", "<Plug>(coc-funcobj-i)", {silent = true})
  keymap("x", "af", "<Plug>(coc-funcobj-a)", {silent = true})
  keymap("o", "af", "<Plug>(coc-funcobj-a)", {silent = true})
  keymap("x", "ic", "<Plug>(coc-classobj-i)", {silent = true})
  keymap("o", "ic", "<Plug>(coc-classobj-i)", {silent = true})
  keymap("x", "ac", "<Plug>(coc-classobj-a)", {silent = true})
  keymap("o", "ac", "<Plug>(coc-classobj-a)", {silent = true})
  keymap("n", "K", ":call CocAction('doHover')<cr>", {silent = true})
  keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", {silent = true, noremap = true, expr = true})
  keymap("i", "<s-tab>", "coc#pum#visible() ? coc#pum#prev(1) : \"\\<s-tab>\"", {silent = true, noremap = true, expr = true})
  keymap("i", "<cr>", "coc#pum#visible() ? coc#_select_confirm() : \"\\<c-g>u\\<cr>\\<c-r>=coc#on_enter()\\<cr>\"", {silent = true, noremap = true, expr = true})
  keymap("i", "<c-y>", "coc#pum#visible() ? coc#_select_confirm() : '<c-y>'", {silent = true, noremap = true, expr = true})
  keymap("n", "<F3>", ":silent CocRestart<cr>", {silent = true, noremap = true})
  keymap("n", "<F4>", "get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'", {silent = true, noremap = true, expr = true})
  keymap("n", "<F9>", ":CocCommand snippets.editSnippets<cr>", {silent = true, noremap = true})
  keymap("n", "<c-e>", ":CocList --auto-preview diagnostics<cr>", {silent = true})
  keymap("n", "mm", "<Plug>(coc-translator-p)", {silent = true})
  keymap("v", "mm", "<Plug>(coc-translator-pv)", {silent = true})
  keymap("n", "(", "<Plug>(coc-git-prevchunk)", {silent = true})
  keymap("n", ")", "<Plug>(coc-git-nextchunk)", {silent = true})
  keymap("n", "C", "get(b:, 'coc_git_blame', '') ==# 'Not committed yet' ? \"<Plug>(coc-git-chunkinfo)\" : \"<Plug>(coc-git-commit)\"", {silent = true, expr = true})
  keymap("n", "\\g", ":call coc#config('git.addGBlameToVirtualText',  !get(g:coc_user_config, 'git.addGBlameToVirtualText', 0)) | call nvim_buf_clear_namespace(bufnr(), -1, line('.') - 1, line('.'))<cr>", {silent = true})
end

return COC
