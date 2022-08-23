require("plugins")
require("lsp")

vim.cmd "set noswapfile"
local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/netcoredbg"

local dap = require "dap"

-- Adapter configuration
dap.adapters.coreclr = {
  type = "executable",
  command = DEBUGGER_LOCATION .. "/netcoredbg",
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
