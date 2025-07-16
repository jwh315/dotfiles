-- OneDark colorscheme - primary theme for this configuration
-- A dark theme inspired by Atom's One Dark theme with modern improvements
-- Customization: Set as default theme with highest priority and immediate loading
return {
  'navarasu/onedark.nvim',
  name = 'onedark',
  lazy = false, -- Load immediately since this is the default theme
  priority = 1000, -- High priority to load before other themes
  config = function()
    vim.cmd 'colorscheme onedark'
  end,
}