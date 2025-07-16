# Neovim Configuration

## Introduction

A modular Neovim configuration based on kickstart.nvim that is:

* **Modular** - Each plugin has its own file for easy maintenance
* **Organized** - Core settings separated from plugin configurations
* **Extensible** - Easy to add, remove, or modify plugins
* **Well-documented** - Clear structure and comments

This configuration builds upon kickstart.nvim with a structured, multi-file approach for better organization and maintainability.

## Features

- **LSP Support**: Configured for Lua, Terraform, and C# (Roslyn)
- **Completion**: nvim-cmp with multiple sources including Copilot
- **File Navigation**: Telescope for fuzzy finding, Oil for file management
- **Git Integration**: Gitsigns, Neogit, and Copilot Chat for commits
- **Themes**: OneDark (default theme)
- **Enhanced Editing**: Treesitter, auto-pairs, commenting, hop navigation
- **Terminal Integration**: Tmux navigator support

## File Structure

```
nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua        # Vim options and settings
│   │   ├── keymaps.lua        # Key mappings
│   │   └── autocmds.lua       # Auto commands
│   ├── plugins/               # Individual plugin configurations
│   │   ├── lsp.lua           # LSP configuration
│   │   ├── cmp.lua           # Completion
│   │   ├── telescope.lua     # Fuzzy finder
│   │   ├── treesitter.lua    # Syntax highlighting
│   │   ├── onedark.lua       # OneDark theme
│   │   └── ... (one file per plugin)
│   └── custom/
│       └── plugins/
│           └── init.lua      # Custom plugin loader
├── init_original.lua         # Backup of original configuration
└── AGENTS.md                 # Development guide
```

## Installation

### Prerequisites

- Neovim 0.9+ (latest stable recommended)
- Git
- Make (for telescope-fzf-native)
- ripgrep
- A C compiler (gcc)
- Node.js (for some LSP servers)

### Install

1. **Backup existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

Lazy.nvim will automatically install all plugins on first run.

## Usage

### Key Mappings

- **Leader key**: `<Space>`
- **File operations**: `<leader>w` (save), `<leader>q` (quit)
- **Search**: `<leader>sf` (find files), `<leader>sg` (live grep)
- **LSP**: `gd` (go to definition), `gr` (references), `K` (hover)
- **File browser**: `-` (open Oil), `<leader>-` (Oil float)
- **Navigation**: `f` (hop to character), `<C-h/j/k/l>` (window nav)
- **Spell check**: `<leader>z` (spell check menu)

### Adding Plugins

1. **Create a new file** in `lua/plugins/`:
   ```bash
   touch lua/plugins/my-plugin.lua
   ```

2. **Add plugin configuration**:
   ```lua
   return {
     'author/plugin-name',
     config = function()
       -- Plugin setup
     end,
   }
   ```

3. **Restart Neovim** - the plugin will be automatically loaded

### Themes

- **Default**: OneDark - A clean, dark theme that's easy on the eyes

To change themes, you can install additional theme plugins by creating new files in `lua/plugins/` following the existing pattern.

### LSP Configuration

LSP servers are configured in `lua/plugins/lsp.lua`. Currently supports:
- **Lua**: lua_ls
- **Terraform**: terraformls
- **C#**: Roslyn (via separate plugin)

To add a new LSP server, add it to the `servers` table in the LSP configuration.

## Customization

### Core Settings

- **Options**: Edit `lua/config/options.lua`
- **Keymaps**: Edit `lua/config/keymaps.lua`
- **Autocmds**: Edit `lua/config/autocmds.lua`

### Plugin Settings

Each plugin has its own file in `lua/plugins/`. Modify the specific plugin file to customize behavior.

### Custom Plugins

Add custom plugins in `lua/custom/plugins/` - they'll be automatically loaded.

## Development

See `AGENTS.md` for development guidelines including:
- Code formatting with Stylua
- File structure conventions
- Plugin configuration patterns

## Troubleshooting

1. **Plugin issues**: Use `:Lazy` to check plugin status
2. **LSP issues**: Use `:LspInfo` to check server status
3. **Restore original**: Replace `init.lua` with `init_original.lua`

## Credits

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with modular organization improvements.
