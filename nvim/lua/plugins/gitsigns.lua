-- Git integration with signs in the gutter and utilities for managing changes
-- Shows git diff information in the sign column and provides commands for staging/unstaging
-- Customization: Uses simple ASCII characters for git signs instead of fancy Unicode
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}