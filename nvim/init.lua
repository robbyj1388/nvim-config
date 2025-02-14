-- Print a message to confirm that the Neovim config is loaded successfully
print("Neovim config loaded successfully!")

-- Require other lua files
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

