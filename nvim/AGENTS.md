# Agents Development Guide

## Build/Lint/Test Commands
- Format Lua code: `stylua .`
- No test framework configured - this is a Neovim configuration

## Code Style Guidelines
- Use 2-space indentation (configured in .stylua.toml)
- Column width: 160 characters
- Single quotes preferred for strings
- No parentheses for function calls when possible
- Use `vim.keymap.set()` instead of deprecated `vim.api.nvim_set_keymap()`
- Use `vim.opt` for options instead of `vim.o`
- Use descriptive variable names and function names
- Group related configurations together
- Use lazy loading for plugins with `event`, `cmd`, or `keys` properties

## File Structure
- `init.lua` - Main entry point, loads all modules
- `lua/config/` - Core configuration (options, keymaps, autocmds)
- `lua/plugins/` - Individual plugin configurations (one file per plugin)
- `lua/custom/plugins/` - Custom plugin configurations
- `lua/kickstart/` - Kickstart-specific modules
- `init_original.lua` - Backup of original monolithic configuration

## Key Conventions
- Leader key: `<space>`
- Use `desc` parameter for all keymaps
- Plugin configurations use `opts = {}` for simple setups
- LSP configurations in servers table with capabilities extension
- Autocommands use clear augroups with descriptive names