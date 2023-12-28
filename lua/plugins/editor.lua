return {
  -- 括号补全
  {
     'windwp/nvim-autopairs',
      lazy = true,
      event = "InsertEnter",
      config = require('plugins.editor.autopairs')
  },
  -- 注释
  {
    'echasnovski/mini.comment',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      mappings = {
        comment_line = '<leader>/',
        comment_visual = '<leader>/'
      }
    }
  },
  -- 普通用户 sudo 保存文件
  {
    'lambdalisue/suda.vim',
    lazy = true,
    cmd = { 'SudaRead', 'SudaWrite' },
    config = require('plugins.editor.suda')
  }
}
