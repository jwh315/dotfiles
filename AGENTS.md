# Global Agents Development Guide

## Universal Code Quality Rules

### Whitespace and Formatting
- **NEVER commit lines with only whitespace** - All lines must be either empty (no characters) or contain actual content
- **NEVER commit trailing whitespace** - Remove all trailing spaces and tabs at the end of lines
- **Before any commit**: Run whitespace cleanup commands to ensure clean code
- **Consistent indentation**: Use the project's configured indentation (spaces vs tabs, width)

### Whitespace Cleanup Commands
```bash
# Remove lines with only whitespace (spaces/tabs)
find . -name "*.lua" -o -name "*.md" -o -name "*.txt" -o -name "*.toml" -o -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.rb" -o -name "*.go" | xargs sed -i '' 's/^[[:space:]]*$//'

# Remove trailing whitespace from all lines
find . -name "*.lua" -o -name "*.md" -o -name "*.txt" -o -name "*.toml" -o -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.rb" -o -name "*.go" | xargs sed -i '' 's/[[:space:]]*$//'
```

### Pre-commit Checklist
Before making any commit, agents must:
1. **Run whitespace cleanup** commands shown above
2. **Run project-specific linters** (if configured)
3. **Check for syntax errors** in modified files
4. **Verify no debug statements** or temporary code remains

### File Organization
- **One concern per file** - Keep related functionality together
- **Clear file naming** - Use descriptive names that indicate purpose
- **Consistent structure** - Follow established patterns within each project
- **Remove unused imports/dependencies** - Keep files clean and minimal

### Git Practices
- **Meaningful commit messages** - Explain the "why" not just the "what"
- **Atomic commits** - Each commit should represent one logical change
- **No merge commits** in feature branches - Use rebase workflow
- **Clean history** - Squash related commits before merging

### Error Handling
- **Never ignore errors** - Handle or explicitly document why ignoring is acceptable
- **Consistent error patterns** - Follow project's error handling conventions
- **User-friendly messages** - Provide helpful error messages for end users

### Documentation
- **Update docs with code changes** - Keep documentation in sync
- **Comment complex logic** - Explain non-obvious code decisions
- **Remove outdated comments** - Clean up comments that no longer apply

## Project-Specific Guidelines

Each project may have additional rules in its local `AGENTS.md` file. Always check for and follow project-specific guidelines that extend these universal rules.

## Tools and Commands

### Universal Linting
```bash
# Check for whitespace issues
grep -rn "^[[:space:]]*$" . --include="*.lua" --include="*.md" --include="*.txt" --include="*.js" --include="*.ts" --include="*.py"

# Check for trailing whitespace
grep -rn "[[:space:]]$" . --include="*.lua" --include="*.md" --include="*.txt" --include="*.js" --include="*.ts" --include="*.py"
```

### File Permissions
- **Executable files**: Only scripts that should be run directly
- **Regular files**: Source code, docs, configs should not be executable
- **Consistent permissions**: Follow project conventions

Remember: Clean code is readable code. These rules ensure consistency across all projects and make code reviews more focused on logic rather than formatting issues.