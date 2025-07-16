-- Highlights and provides navigation for TODO, FIXME, and other comment tags
-- Adds syntax highlighting for special comment keywords and enables searching
-- Customization: Signs disabled to avoid clutter in the sign column
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false }, -- Disable signs in gutter for cleaner appearance
}