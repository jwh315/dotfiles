local copilot_commit_prompt = [[
Write a commit message for the staged changes using a conventional commit.

The scope of the commit title should be derived from the system context. Given the
output starts with the chars US. Otherwise the scope should not be included.

Keep the title under 50 characters and wrap message at 72 characters.

The commit body should be bullet point formatted.

Format as a gitcommit code block.
]]

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'github/copilot.vim' },
    { 'nvim-lua/plenary.nvim', branch = 'master' },
  },
  build = 'make tiktoken',
  opts = {
    prompts = {
      Commit = {
        prompt = copilot_commit_prompt,
        context = { 'git:staged', "system:`git branch --show-current | cut -d'/' -f1`" },
      },
    },
  },
  keys = {
    { '<leader>ccv', '<cmd>CopilotChatToggle<cr>', desc = 'Chat with Copilot' },
  },
}