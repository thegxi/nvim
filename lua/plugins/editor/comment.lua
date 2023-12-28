return function()
   require('mini.comment').setup({
    options = {
      mappings = {
        comment_line = '<leader>/',
        comment_visual = '<leader>/'
      }
    }
  })
end
