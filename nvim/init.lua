-- Load core configuration
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require('lazy').setup {
  -- Import plugins from lua/plugins/ directory
  { import = 'plugins' },

  -- Import custom plugins
  { import = 'custom.plugins' },
}

