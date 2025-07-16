return {
  'phaazon/hop.nvim',
  opts = {},
  config = function()
    require('hop').setup {}
    
    -- Override 'f' key to use hop
    vim.keymap.set('n', 'f', function()
      require('hop').hint_char1 { current_line_only = false }
    end, { remap = true })
  end,
}