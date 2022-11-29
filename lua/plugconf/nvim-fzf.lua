local CONF = {}

function CONF.config()
    vim.g.fzf_preview_window = {'right:40%', 'ctrl-/'}
    vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    vim.g.fzf_layout = {
        window={
            width=0.9,
            height=0.6
        }
    }
    vim.api.nvim_command("com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}), <bang>0)")
    vim.api.nvim_command("com! CHistory call CHistory()")
    vim.api.nvim_command([[
    func! CHistory()
      call filter(v:oldfiles, "v:val =~ '^' . $PWD . '.*$'")
      call fzf#vim#history(fzf#vim#with_preview(), 0)
    endf
    ]])
    vim.api.nvim_set_keymap('n', '<c-a>', ':Ag<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('n', '<c-p>', ':Files<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('n', '<c-l>', ':BLines<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('n', '<c-g>', ':GFiles?<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('n', '<c-h>', ':CHistory<cr>', {silent = true, noremap = true})
end

function CONF.setup()
    -- do nothing
end

return CONF
