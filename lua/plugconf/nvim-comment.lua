local CONF = {}

function CONF.config()
    vim.g.vim_line_comments = {
        vim = '"',
        vimrc = '"',
        js = '//',
        ts = '//',
        java = '//',
        class = '//',
        c = '//',
        h = '//',
        go = '//',
        lua = '--',
        proto = '//',
        ['go.mod'] = '//',
        md = '[^_^]:',
        vue = '//',
        sql = '--',
    }
    vim.g.vim_chunk_comments = {
        js = {'/**', ' *', ' */'},
        ts = {'/**', ' *', ' */'},
        sh = {':<<!', '', '!'},
        proto = {'/**', ' *', ' */'},
        md = {'[^_^]:', '    ', ''},
        vue = {'/**', ' *', ' */'},
    }
    vim.api.nvim_set_keymap('n', '??', ':NToggleComment<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('v', '/', ':<c-u>VToggleComment<cr>', {silent = true, noremap = true})
    vim.api.nvim_set_keymap('v', '?', ':<c-u>CToggleComment<cr>', {silent = true, noremap = true})
end

function CONF.setup()
    -- do nothing
end

return CONF
