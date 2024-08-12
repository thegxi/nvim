local settings = {}

-- Set it to false if you don't use copilot
---@type boolean
settings["use_copilot"] = true

-- Set the command for handling external URLs here. The executable must be available on your $PATH.
-- This entry is IGNORED on Windows and macOS, which have their default handlers builtin.
---@type string
settings["external_browser"] = "chrome-cli open"


return settings
