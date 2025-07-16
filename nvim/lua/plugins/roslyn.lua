-- Microsoft Roslyn LSP server for C# development
-- Provides rich language features for C# including IntelliSense, refactoring, and debugging
-- Customization: Only loads for C# files (ft = 'cs') for performance
return {
  'seblj/roslyn.nvim',
  ft = 'cs',
  opts = {},
}