-- Magit-like Git interface for Neovim
-- Provides a comprehensive Git workflow interface with staging, committing, and history
-- Integrates with diffview for visual diffs and telescope for enhanced searching
return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim',
  },
  config = true,
}