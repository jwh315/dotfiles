require("plugins")
require("lsp")

vim.cmd "set noswapfile"
local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim"

local dap = require "dap"

-- Adapter configuration
dap.adapters.coreclr = {
  type = "executable",
  command = DEBUGGER_LOCATION .. "/netcoredbg/netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to DLL > ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { DEBUGGER_LOCATION.. "/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
    localSourceRoot = HOME .. "/Code/CD/"
  }
}
