return function()
  local grug = require("grug-far")
  local options = {
    engine = "ripgrep"
  }

  grug.setup(options)
end
