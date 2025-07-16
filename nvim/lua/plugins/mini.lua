-- Collection of independent mini plugins for various functionality
-- Provides AI text objects, surround operations, and a minimal statusline
-- Customizations: Extended line search for text objects, custom statusline location format
return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 } -- Extended range for text object search
    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup()

    -- Custom statusline location format
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}