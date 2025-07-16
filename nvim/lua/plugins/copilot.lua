-- GitHub Copilot AI code completion integrated with nvim-cmp
-- Provides AI-powered code suggestions and completions
-- Customization: Panel and inline suggestions disabled, only works through nvim-cmp
return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'BufEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = false, -- Disabled in favor of cmp integration
        },
        suggestion = {
          enabled = false, -- Disabled in favor of cmp integration
        },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}