-- SOPS (Secrets OPerationS) integration for editing encrypted files
-- Automatically decrypts SOPS-encrypted files when opening and re-encrypts on save
-- Useful for managing encrypted configuration files and secrets
return {
  'lucidph3nx/nvim-sops',
  event = { 'BufEnter' },
  opts = {},
}