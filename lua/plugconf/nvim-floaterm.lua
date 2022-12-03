local CONF = {}

function FTToggle(name, cmd, pre_cmd)
    if vim.fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        vim.api.nvim_command(string.format('exec "FloatermToggle %s"', name))
    else
        vim.api.nvim_command(string.format('exec "%s"', pre_cmd))
        vim.api.nvim_command(string.format('FloatermNew --autoclose=0 --name=%s %s', name, cmd))
    end
end
function SetFTToggleMap(key, name, cmd, pre_cmd)
    vim.api.nvim_set_keymap('n', key, string.format(":call v:lua.FTToggle('%s', '%s', '%s')<cr>", name, cmd, pre_cmd), {silent = true, noremap = true})
    vim.api.nvim_set_keymap('t', key, "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('" .. name .. "') == bufnr('%') ? '' : '" .. key.. "') : '" .. key.. "'", {silent = true, expr = true})
end

function CONF.config()
    local run_cmd = { javascript = 'node', typescript = 'ts-node', html = 'open -a Google\\ Chrome', python = 'python', go = 'go run', sh = 'bash', lua = 'lua' }
    vim.g.floaterm_title = ''
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_autoclose = 1
    vim.g.floaterm_opener = 'edit'
    vim.api.nvim_command("au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif")
    vim.api.nvim_command("hi FloatermBorder ctermfg=none ctermbg=none")
    function RunFile()
        vim.api.nvim_command('w')
        local ft = vim.api.nvim_eval('&ft')
        if run_cmd[ft] then FTToggle('RUN', run_cmd[ft] .. ' %', '')
        elseif ft == 'markdown' then vim.api.nvim_command('MarkdownPreview')
        elseif ft == 'java' then FTToggle('RUN', 'javac % && java %<', '')
        elseif ft == 'c' then FTToggle('RUN', 'gcc % -o %< && ./%< && rm %<', '')
        end
    end

    vim.api.nvim_command([[
        func! SetVimDir()
            try
                call system('echo "' . $PWD . '" > $ZSH/cache/vimdir')
            endtry
        endf
    ]])

    SetFTToggleMap('<c-b>', 'DBUI', 'nvim +CALLDB', '')
    SetFTToggleMap('<c-t>', 'TERM', '', 'call SetVimDir()')
    vim.api.nvim_set_keymap('n', '<F5>', ':call v:lua.RunFile()<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('i', '<F5>', '<esc>:call v:lua.RunFile()<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('t', '<F5>', "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('RUN') == bufnr('%') ? '' : '<F5>') : '<F5>'", {silent = true, expr = true})
end

function CONF.setup()
    -- do nothing
end

return CONF
