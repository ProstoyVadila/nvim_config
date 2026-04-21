# Neovim Config

Neovim 0.12+ config using `vim.pack` for plugin management. Leader key is `Space`.

## Structure

```
init.lua              -- Entry point, loads modules, sets colorscheme (kanagawa)
lua/
  config.lua          -- Editor options (tabs, line numbers, winbar, mouse, clipboard)
  plugins.lua         -- Plugin declarations and setup
  keymap.lua          -- Key mappings
  lsp.lua             -- LSP server list and diagnostics config
  autocmd.lua         -- Autocommands (treesitter highlighting, yank highlight)
lsp/
  basedpyright.lua    -- Python (basedpyright with semantic tokens)
  ruff.lua            -- Python linting/formatting
  lua_ls.lua          -- Lua
  bashls.lua          -- Bash
  bqls.lua            -- BigQuery SQL
  golangci_lint_ls.lua -- Go linting
  rust-analyzer.lua   -- Rust (via rustaceanvim)
  circleci_ls.lua     -- CircleCI config
  rumdl.lua           -- Markdown linting
  sourcekit.lua       -- Swift
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| kanagawa.nvim | Colorscheme |
| mason.nvim | LSP/tool installer |
| lualine.nvim | Statusline |
| fzf-lua | Fuzzy finder (files, grep, buffers) |
| blink.cmp | Autocompletion (LSP source) |
| oil.nvim | File explorer (editable buffer) |
| nvim-treesitter | Parser installer for treesitter highlighting |
| gitsigns.nvim | Git gutter signs, blame, hunk navigation |
| conform.nvim | Format on save (ruff, stylua, rustfmt, gofmt, shfmt) |
| nvim-autopairs | Auto-close brackets/quotes |
| todo-comments.nvim | Highlight and search TODO/FIXME/HACK comments |
| which-key.nvim | Keymap hints popup |
| rustaceanvim | Enhanced Rust LSP integration |
| neoscroll.nvim | Smooth animated scrolling |

## Key Mappings

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files |
| `<leader>/` | Live grep |
| `<leader>b` | Buffers |
| `<leader>e` | Oil file explorer |
| `<leader>fo` | Format file |
| `<leader>ft` | Search TODOs |
| `gd` | Go to definition |
| `K` | Hover docs |
| `<leader>o` | Jump back |
| `<leader>gb` | Git blame line |
| `<leader>gp` | Preview hunk |
| `<leader>gr` | Reset hunk |
| `]h` / `[h` | Next/prev git hunk |

## Notes

- Treesitter highlighting is enabled via `vim.treesitter.start()` in a FileType autocmd. Parsers are installed by nvim-treesitter (`ensure_installed`). Requires `tree-sitter` CLI (`cargo install tree-sitter-cli`).
- Python uses basedpyright (not pyright) for semantic token support.
- Format on save is enabled globally via conform.nvim with LSP fallback.
- System clipboard is shared (`unnamedplus`).
- Winbar shows the filepath at the top of each window.
- `<Tab>` in insert mode accepts a completion if the menu is open, otherwise inserts spaces normally.
- neoscroll uses quadratic easing on `Ctrl+u/d/b/f` and `zt/zz/zb`.
