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
  }
}
