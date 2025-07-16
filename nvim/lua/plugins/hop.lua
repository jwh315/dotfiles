-- EasyMotion-like navigation plugin for quick cursor movement
-- Allows rapid jumping to any visible location by highlighting characters
-- Customization: Overrides 'f' key to use hop for character navigation across entire buffer
return {
  'phaazon/hop.nvim',
  opts = {},
  config = function()
    require('hop').setup {}

    -- Override 'f' key to use hop instead of default find character
    vim.keymap.set('n', 'f', function()
      require('hop').hint_char1 { current_line_only = false }
    end, { remap = true })
  end,
}