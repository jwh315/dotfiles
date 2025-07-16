-- Advanced syntax highlighting and code understanding using Tree-sitter
-- Provides better syntax highlighting, indentation, and code structure analysis
-- Includes playground for inspecting syntax trees and testing queries
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        auto_install = true, -- Automatically install missing parsers
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  {
    'nvim-treesitter/playground', -- Tree-sitter playground for testing and inspection
  },
}