return {
  -- 括号补全
  {
     'windwp/nvim-autopairs',
      lazy = true,
      event = "InsertEnter",
      config = require('plugins.config.editor.autopairs')
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
  -- sudo 保存文件
  {
    'lambdalisue/suda.vim',
    lazy = true,
    cmd = { 'SudaRead', 'SudaWrite' },
    config = require('plugins.config.editor.suda')
  }
}
