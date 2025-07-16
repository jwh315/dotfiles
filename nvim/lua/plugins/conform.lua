-- Lightweight and fast formatting plugin that can use multiple formatters
-- Automatically formats code on save with language-specific formatters
-- Customizations: Excludes 'master-control' files, supports Lua and Terraform formatters
return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if string.find(bufname, 'master%-control') then
        return -- Skip formatting for master-control files
      end

      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      terraform = { 'terraform_fmt' },
    },
  },
}