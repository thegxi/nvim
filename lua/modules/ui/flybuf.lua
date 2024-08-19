return function()
  local options = {
    hotkey = 'asdfghwertyuiopzcvbnm',  -- hotkye
    border = 'single',                 -- border
    quit = 'q',                        -- quit flybuf window
    mark = 'l',                        -- mark as delet or cancel delete
    delete = 'x',                      -- delete marked buffers or buffers which cursor in
  }
  require("flybuf").setup(options)
end
